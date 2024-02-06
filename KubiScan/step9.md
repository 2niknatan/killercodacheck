## Pods Secrets Volume Scan
Pods might have access to secrets through a volume. KubiScan offers a scan of those pods and shows the path of the secrets and their name by running the following command:
<code>kubiscan –psv</code>

## Pods Secrets enviroment Scan
Similar to 'Secrets Volume' there are pods that can access secrets through environment variables instead of volumes. By running the following command we can find the pods and secrets:
<code>kubiscan –pse</code>
