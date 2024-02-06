A risky pod is a pod that has a high privileged subject, connected to one of its containers.

## Risky Pods Scan

Let's begin our scan by scanning for risky pods in our system by running the following command:

<code>kubiscan -rp</code>

One of the lines in the output should look like this:
```
+----------------+
|Risky Containers|
+----------+---------+-----------+---------------+-------------------------+--------------------+
| Priority | PodName | Namespace | ContainerName | ServiceAccountNamespace | ServiceAccountName |
+----------+---------+-----------+---------------+-------------------------+--------------------+
| CRITICAL | mypod   | default   | c2            | default                 | kubiscan-sa        |
+----------+---------+-----------+---------------+-------------------------+--------------------+
```
