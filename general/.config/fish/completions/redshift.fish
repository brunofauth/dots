complete --command=redshift --short-option=h --description="display help and exit"
complete --command=redshift --short-option=v --description="enable verbose output"
complete --command=redshift --short-option=V --description="display version and exit"
complete --command=redshift --short-option=x --description="reset color adjustments and exit"
complete --command=redshift --short-option=r --description="disable smooth color transitioning/fading"
complete --command=redshift --short-option=p --description="print given parameters and exit"
complete --command=redshift --short-option=P --description="reset existing gamma ramps before applying new color"
complete --command=redshift --short-option=o --description="one-shot color adjustment"

complete --command=redshift --short-option=c --require-parameter --force-files --description="load configs from file"
complete --command=redshift --short-option=b --exclusive --description="screen brightness, as DAY:NIGHT, between 0.1-1.0"
complete --command=redshift --short-option=g --exclusive --description="gamma correction, as R:G:B"
complete --command=redshift --short-option=l --exclusive --description="LATIDUTE:LONGITUDE, as float"
complete --command=redshift --short-option=l --exclusive --description="location provider; list them by passing 'list'"
complete --command=redshift --short-option=m --exclusive --description="color setting method; list them by passing 'list'"
complete --command=redshift --short-option=o --exclusive --description="set color temperature to TEMP, in one-shot mode"
complete --command=redshift --short-option=t --exclusive --description="color temperature to use, as DAY:NIGHT"

complete --command=redshift --no-files
