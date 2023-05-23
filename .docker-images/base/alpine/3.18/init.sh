#!/bin/bash

echo """
########## DSP ALPINE BASE ##############
"""

if [ -n "$GATEWAY" ]; then
    echo "[+] Set gateway to $GATEWAY"
    /setgw.sh --gateway $GATEWAY
fi
bash /adduser.sh --name dsp --password dsp

# If a custom_init.sh command exists, the execute it before blocking. In this way it is possible to override the init command
if test -e /custom_init.sh; then
 	bash /custom_init.sh
fi
tail -f /dev/null
