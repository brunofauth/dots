# config.nu
#
# Installed by:
# version = "0.116.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings,
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.show_banner = "short"
$env.config.buffer_editor = [ "vim" ]
$env.config.filesize.unit = 'binary'
$env.config.table.mode = 'light'
$env.config.table.abbreviated_row_count = 150
$env.config.completions.algorithm = "substring"

# builtins, resolved external commands and unresolved one get different colors
$env.config.highlight_resolved_externals = true
$env.config.color_config.shape_external = "red"

$env.config.hooks.command_not_found = {||
    nix-locate --whole-name bin/htop
}


let default_prompt = $env.PROMPT_COMMAND
$env.PROMPT_COMMAND = {||
    # {{{

    let prompt = (do $default_prompt)
    let git_dir = (^git rev-parse --git-dir | complete)
    if $git_dir.exit_code != 0 { return $prompt }                 # not in a git repo
    let git_dir = ($git_dir.stdout | str trim)
    let in_git_dir = {|name| $git_dir | path join $name | path exists }

    let operation = if (do $in_git_dir 'rebase-merge') or (do $in_git_dir 'rebase-apply') {
        'REBASING'
    } else if (do $in_git_dir 'MERGE_HEAD') {
        'MERGING'
    } else if (do $in_git_dir 'CHERRY_PICK_HEAD') {
        'CHERRY-PICKING'
    } else if (do $in_git_dir 'REVERT_HEAD') {
        'REVERTING'
    } else if (do $in_git_dir 'BISECT_LOG') {
        'BISECTING'
    } else {
        null
    }

    # During a rebase HEAD is detached; the branch being rebased is in rebase-merge/head-name.
    let rebased = ['rebase-merge' 'rebase-apply']
        | each {|d| $git_dir | path join $d 'head-name' }
        | where {|f| $f | path exists }
    let branch = if ($rebased | is-not-empty) {
        open --raw ($rebased | first) | str trim | str replace 'refs/heads/' ''
    } else {
        let current = (^git branch --show-current | str trim)
        if $current != '' { $current } else { $"\((^git rev-parse --short HEAD | str trim)\)" }
    }

    let conflicts = if $operation == null { 0 } else {
        ^git diff --name-only --diff-filter=U | lines | length
    }

    let colors = if (config use-colors) {
        {branch: (ansi magenta), operation: (ansi yellow_bold), conflicts: (ansi red_bold)}
    } else {
        {branch: '', operation: '', conflicts: ''}
    }
    mut segment = $"($colors.branch)($branch)(ansi reset)"
    if $operation != null { $segment += $" ($colors.operation)($operation)(ansi reset)" }
    if $conflicts > 0 { $segment += $" ($colors.conflicts)($conflicts) conflicted(ansi reset)" }
    if $conflicts > 0 { $segment += $" ($colors.conflicts)($conflicts) conflicted(ansi reset)" }
    $"($prompt) ($segment)"
} # }}}


$env.config.abbreviations = {
    # {{{
    ga:  'git add'
    gs:  'git status'
    gss: 'git status --short'
    gco: 'git checkout'
    gca: 'git commit --amend'
    gp:  'git push'
    gpu: 'git push --set-upstream'
    gt:  'gitui'
    ll:  'ls -l'
    la:  'ls -la'
    cls: 'clear'
} # }}}


# Use fish as the completer command
# {{{

let fish_completer = {
    |place|
        fish --command $"complete '--do-complete=($place.command | str replace --all "'" "\\'" | str join ' ')'"
        | from tsv --flexible --noheaders --no-infer
        | rename value description
  }

$env.config.completions.external = {
    enable: true
    max_results: 100
    completer: $fish_completer
}

# }}}


# Suggest which package provides a missing command: nix-index on Nix, pkgfile on Arch.
# The returned string becomes the `help:` line of the "command not found" error.
$env.config.hooks.command_not_found = {|cmd|
    # {{{
    let has = {|name| which $name | is-not-empty }

    let nix_hint = if not (do $has nix) { null } else if not (do $has nix-locate) {
        "nix: install nix-index to find the package that provides it: `nix profile install nixpkgs#nix-index`"
    } else {
        let found = (^nix-locate --minimal --no-group --type x --type s --whole-name --at-root $"/bin/($cmd)" | complete)
        # `(attr)` lines are packages that only depend on the one holding the file
        let pkgs = ($found.stdout | lines | where not ($it | str starts-with '(') | str replace --regex '\.out$' '' | uniq)
        if $found.exit_code != 0 {
            "nix: nix-index has no database yet; build it with `nix-index`"
        } else if ($pkgs | is-empty) {
            $"nix: no nixpkgs package provides `($cmd)`"
        } else {
            $"nix: provided by ($pkgs | str join ', '); try `nix shell nixpkgs#($pkgs | first)`"
        }
    }

    let pacman_hint = if not (do $has pacman) { null } else if not (do $has pkgfile) {
        "pacman: install pkgfile to find the package that provides it: `sudo pacman -S pkgfile && sudo pkgfile --update`"
    } else {
        let found = (^pkgfile --binaries $cmd | complete)
        let pkgs = ($found.stdout | lines | where $it != '')
        if ($pkgs | is-not-empty) {
            $"pacman: provided by ($pkgs | str join ', '); try `sudo pacman -S ($pkgs | first)`"
        } else if ($found.stderr | str trim | is-not-empty) {
            # most likely the file lists were never downloaded
            $"pacman: pkgfile failed: ($found.stderr | str trim); try `sudo pkgfile --update`"
        } else {
            $"pacman: no repository package provides `($cmd)`"
        }
    }

    let hints = ([$nix_hint $pacman_hint] | compact)
    # `collect`: `str join` returns a stream, and a hook returning one is silently ignored
    if ($hints | is-empty) { null } else { $hints | str join "\n" | collect }
} # }}}

