#!/usr/bin/env bash

## Script to manage KVM VM's at the command line.
## I keep forgetting the virsh commands.

. /usr/local/bin/functs

if [[ 'root' != `whoami` ]]; then
    cat << EOF
    
    The tau you seek cannot be found for thou are not root
    young ${USER};

EOF
    exit 1;
else
    echo ;
    echo 'virsh list --all --table --title;'
    echo ;
    virsh list --all --table --title;
    pause;
    cat << EOF
    
    To start or stop a VM (you must be root):

  virsh start     foo     (start VM named foo)
  virsh shutdown  foo     (hard stop)
  virsh reboot    foo     (reset emulates the power reset button)
  virsh suspend   foo     (keep VM in memory but won't be scheduled)
  virsh resume    foo     (opposite of 'suspend')

    To open the graphical console (again, as root):

  virt-viewer foo &

EOF
fi
exit 0;

