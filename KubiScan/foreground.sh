cd /tmp/KubiScan
pip install -r requirements.txt
alias kubiscan='python3 /tmp/KubiScan/KubiScan.py'
kubectl apply -f kubiscan-sa.yaml
KUBISCAN_SA_SECRET=$(kubectl get sa kubiscan-sa -o=jsonpath='{.secrets[0].name}')
kubectl apply -f - << EOF
apiVersion: v1
kind: Pod
metadata:
  name: mypod
  namespace: default
spec:
  serviceAccountName: kubiscan-sa
  containers:
  - image: nginx
    name: c1
    volumeMounts:
    - name: secret-volume
      readOnly: true
      mountPath: "/var/run/secrets/kubernetes.io/serviceaccount"
    - name: not-token-secret
      mountPath: "/var/run/secrets/tokens"
  - image: nginx
    name: c2
  volumes:
  - name: secret-volume
    secret:
      secretName: "${KUBISCAN_SA_SECRET}"
  - name: not-token-secret
    secret:
      secretName: mysecret
EOF

kubectl apply -f my-pod-env.yaml
kubectl apply -f pod-with-host-access.yaml
kubiscan