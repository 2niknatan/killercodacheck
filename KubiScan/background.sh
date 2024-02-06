cd /tmp
git clone https://github.com/cyberark/KubiScan.git
cd /tmp/KubiScan
pip install -r requirements.txt
alias alias kubiscan='python3 /tmp/KubiScan/KubiScan.py'
kubectl apply -f - << EOF
apiVersion: v1
kind: Secret
metadata:
  name: kubiscan-sa-secret
type: Opaque
data:
  username: dXNlcm5hbWU=
  password: cGFzc3dvcmQ=
EOF
kubectl apply -f - << EOF
apiVersion: v1
kind: ServiceAccount
metadata:
  name: kubiscan-sa
  namespace: default
secrets:
  - name: kubiscan-sa-secret
---
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata: 
  name: kubiscan-clusterrolebinding
subjects: 
- kind: ServiceAccount 
  name: kubiscan-sa
  namespace: default
  apiGroup: ""
roleRef: 
  kind: ClusterRole
  name: kubiscan-clusterrole
  apiGroup: ""
---
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata: 
  name: kubiscan-clusterrole
rules: 
- apiGroups: ["*"]
  resources: ["roles", "clusterroles", "rolebindings", "clusterrolebindings", "pods", "secrets"]
  verbs: ["get", "list"]
EOF
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
      secretName: kubiscan-sa-secret
  - name: not-token-secret
    secret:
      secretName: mysecret
EOF
kubectl apply -f - << EOF
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  username: dXNlcm5hbWU=
  password: cGFzc3dvcmQ=
---
apiVersion: v1
kind: Pod
metadata:
  name: my-pod-env
spec:
  containers:
  - name: my-container
    image: my-image
    env:
    - name: MY_USERNAME
      valueFrom:
        secretKeyRef:
          name: my-secret
          key: username
    - name: MY_PASSWORD
      valueFrom:
        secretKeyRef:
          name: my-secret
          key: password
EOF
kubectl apply -f - << EOF
apiVersion: v1
kind: Pod
metadata:
  name: pod-with-host-access-and-volume
spec:
  containers:
  - name: host-access-container
    image: your-image
    securityContext:
      privileged: true
    volumeMounts:
    - name: host-volume
      mountPath: /host-data
  volumes:
  - name: host-volume
    hostPath:
      path: /path/on/host
EOF



