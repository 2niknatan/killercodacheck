#!/bin/bash
alias kubiscan='python3 /tmp/KubiScan/KubiScan.py'
echo "KubiScan installing requirements..."; while [ ! -f /tmp/.backgroundfinished ] ; do sleep 1; done; echo "Done!"
kubiscan
