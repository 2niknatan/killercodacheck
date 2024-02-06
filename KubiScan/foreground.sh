#!/bin/bash
alias kubiscan='python3 /tmp/KubiScan/KubiScan.py'
echo "KubiScan installing requirments..."; while [ ! -f /tmp/.backgroundfinished ] ; do sleep 2; done; echo "Done!"
kubiscan
