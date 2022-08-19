complete --command=mhwd --long-option=pci --description="list only pci devices and driver configs"
complete --command=mhwd --long-option=usb --description="list only usb devices and driver configs"

complete --command=mhwd --short-option=h --long-option=help --description="show help"
complete --command=mhwd --short-option=v --long-option=version --description="show version of mhwd"
complete --command=mhwd --short-option=f --long-option=force --description="force reinstallation"
complete --command=mhwd --short-option=d --long-option=detail --description="show detailed info for -l/-li/-lh"
complete --command=mhwd --short-option=l --long-option=list --description="list available configs for devices"

complete --command=mhwd --old-option=la --long-option=listall --description="list all driver configs"
complete --command=mhwd --old-option=li --long-option=listinstalled --description="list installed driver configs"
complete --command=mhwd --old-option=lh --long-option=listhardware --description="list hardware information"

complete --command=mhwd --exclusive --arguments="usb pci" --short-option=i --long-option=install \
    --description="install driver config(s)"
complete --command=mhwd --exclusive --arguments="usb pci" --old-option=ic  --long-option=installcustom \
    --description="install custom config(s)"
complete --command=mhwd --exclusive --arguments="usb pci" --short-option=r --long-option=remove \
    --description="remove driver config(s)"
complete --command=mhwd --exclusive --arguments="usb pci" --short-option=a --long-option=auto \
    --description="auto install configs for classid"

    # complete --command=mhwd --exclusive \
    #     --condition="__fish_seen_argument -s=i  -l=install"
    # complete --command=mhwd --require-parameter \
    #     --condition="__fish_seen_argument -o=ic -l=installcustom"
    # complete --command=mhwd --exclusive \
    #     --condition="__fish_seen_argument -s=r  -l=remove"
    # complete --command=mhwd --exclusive --arguments="free nonfree" \
    #     --condition="__fish_seen_argument -s=a  -l=auto"

    # -i/--install <usb/pci> <config(s)>	
    # -r/--remove <usb/pci> <config(s)>	remove driver config(s)
    # -a/--auto <usb/pci> <free/nonfree> <classid>

complete --command=mhwd --require-parameter --long-option=pmcachedir --description="set package manager cache path"
complete --command=mhwd --require-parameter --long-option=pmconfig --description="set package manager config"
complete --command=mhwd --require-parameter --long-option=pmroot --description="set package manager root"

