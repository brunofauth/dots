vim9script

compiler shellcheck

command -buffer Check {
    silent lmake! %
    lopen
    redraw!
    }

command -buffer -range=% ShellRun {
    execute "<line1>,<line2>w ! sh -"
    }
