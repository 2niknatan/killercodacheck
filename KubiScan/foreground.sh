alias kubiscan='python3 /tmp/KubiScan/KubiScan.py'
echo "KubiScan installing requirments..."
while [ ! -f /tmp/background_complete.marker ]; do
    sleep 1
done
echo "Done!"
kubiscan
