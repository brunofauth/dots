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

$env.config.filesize.unit = 'binary'
$env.config.table.mode = 'light'
$env.config.table.abbreviated_row_count = 150

# Custom prompt
# {{{
let default_prompt = $env.PROMPT_COMMAND

$env.PROMPT_COMMAND = {||
    let prompt = (do $default_prompt)
    let git_dir_cmd_out = (^git rev-parse --git-dir | complete)
    if $git_dir_cmd_out.exit_code != 0 {
        return $prompt
    }

    let git_dir = ($git_dir_cmd_out.stdout | str trim)
    let in_git_dir = {|name| $git_dir | path join $name | path exists }

    let operation =
             if (do $in_git_dir 'rebase-merge')     { 'REBASING' }
        else if (do $in_git_dir 'rebase-apply')     { 'REBASING' }
        else if (do $in_git_dir 'MERGE_HEAD')       { 'MERGING' }
        else if (do $in_git_dir 'CHERRY_PICK_HEAD') { 'CHERRY-PICKING' }
        else if (do $in_git_dir 'REVERT_HEAD')      { 'REVERTING' }
        else if (do $in_git_dir 'BISECT_LOG')       { 'BISECTING' }
        else                                        { null }

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

    let colors = if (config use-colors) { {
        branch:    (ansi magenta)
        operation: (ansi yellow_bold)
        conflicts: (ansi red_bold)
    } } else { {
        branch:    ''
        operation: ''
        conflicts: ''
    } }
    mut segment = $"($colors.branch)($branch)(ansi reset)"
    if $operation != null {
        $segment += $" ($colors.operation)($operation)(ansi reset)"
    }
    if $conflicts > 0 {
        $segment += $" ($colors.conflicts)($conflicts) conflicted(ansi reset)"
    }
    $"($prompt) ($segment)"
}

# }}}


$env.ABBREVIATIONS = {
    gs: 'git status'
    gss: 'git status --short'
    gco: 'git checkout'
    gca: 'git commit --ammend'
    ll: 'ls -l'
    la: 'ls -la'
}


# Fish-like abbr implementation
# {{{

# The buffer with the abbreviation just before the cursor expanded, and the new cursor; null when
# the word there isn't an abbreviation in command position (line start, or after | ; or `(`).
def abbreviation-expanded [buffer: string, cursor: int] {
    let before = ($buffer | str substring --grapheme-clusters 0..<$cursor)
    let after = ($buffer | str substring --grapheme-clusters $cursor..)
    let parsed = ($before | parse --regex '^(?<head>.*?)(?<word>[^\s|;(]*)$' | first)
    let in_command_position = ($parsed.head | str trim --right | str replace --regex '.*?(\S?)$' '$1') in ['' '|' ';' '(']
    let expansion = ($env.ABBREVIATIONS | get --optional $parsed.word)
    if $parsed.word == '' or not $in_command_position or $expansion == null { return null }
    let expanded_before = $"($parsed.head)($expansion)"
    {buffer: $"($expanded_before)($after)", cursor: ($expanded_before | str length --grapheme-clusters)}
}


# Expands the abbreviation before the cursor in the line being typed (for the keybindings).
def expand-abbreviation [] {
    let expanded = (abbreviation-expanded (commandline) (commandline get-cursor))
    if $expanded != null {
        commandline edit --replace $expanded.buffer
        commandline set-cursor $expanded.cursor
    }
}


$env.config.keybindings ++= [
    {
        name: expand_abbreviation_on_space
        modifier: none
        keycode: space
        mode: [emacs vi_insert]
        # Caveat: this relies on the line editor stopping the event list after
        # a nushell command runs. That's what 0.116.1 does, as tested above. If
        # a future nushell version changes it, you'd see doubled spaces after
        # words with no menu open.
        event: [
            {
                until: [
                    [{send: menunext} {send: menuprevious}]
                    {send: executehostcommand cmd: "expand-abbreviation; commandline edit --insert ' '"}
                ]
            }
            {edit: insertchar value: ' '}
        ]
    }
    {
        name: expand_abbreviation_on_enter
        modifier: none
        keycode: enter
        mode: [emacs vi_insert]
        event: {
            until: [
                {send: menuaccept}
                {send: executehostcommand cmd: 'expand-abbreviation; commandline edit --replace --accept (commandline)'}
            ]
        }
    }
]

# }}}


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

