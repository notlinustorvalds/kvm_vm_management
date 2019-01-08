#!/usr/bin/env bash

## Local script to get network manager and libvirt networking sorted so you
## can boot a @#$?ing virtual machine...

if [[ 'root' != `whoami` ]]; then
    cat << EOF
    
    You must be root to use this, ${USER}.

EOF
    exit 1;
else
    echo ;
#    echo 'nmcli con down virbr0; nmcli con down virbr1; nmcli con show'
#    echo ;
#    nmcli con down virbr0;
#    nmcli con down virbr1;
    echo 'vvvvvvvvvvvvvvvvvvvv $ nmcli con show --active vvvvvvvvvvvvvvvvvvvv'
    nmcli con show --active;
#    echo ;
#    echo '---------------------------------------------------------------------';
    echo ;
#    echo 'virsh net-start default; virsh net-start herzog_vms; virsh net-list;'
#    echo ;
#    virsh net-start default;
#    virsh net-start herzog_vms;
    echo 'vvvvvvvvvvvvvvvvvvvv $ virsh net-list --all vvvvvvvvvvvvvvvvvvvv';
    virsh net-list --all;
    echo '---------------------------------------------------------------------';
    cat << EOF
------------- To enable networking for a VM:-------------------

1. Disable the @#$@ing connection that NetworkManager has decided to activate 
   to be "helpful"   ("virbr0" shown for reference):
            sudo  nmcli con down    'virbr0';

2. Enable / check the lib-virt network connection ("122.x" shown for reference):
            sudo  virsh net-start  '122.x';  sudo  virsh net-list;

(or all as a one-liner):
    nmcli con down 'virbr0'; virsh net-start '122.x'; virsh net-list;

EOF

fi

