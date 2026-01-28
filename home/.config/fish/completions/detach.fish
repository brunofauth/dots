complete --command=detach --short-option=e --require-parameter --description="pass file as stderr"
complete --command=detach --short-option=i --require-parameter --description="pass file as stdin"
complete --command=detach --short-option=o --require-parameter --description="pass file as stdout"
complete --command=detach --short-option=p --require-parameter --description="write the pid of the detached process to file"
complete --command=detach --short-option=f --description "run in foreground instead of forking"
complete --command=detach --condition '__fish_use_subcommand' --arguments "(find /usr/bin -type f -printf '%f\n')"

# complete --command=detach --arguments
