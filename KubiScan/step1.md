## Run the following command:

Let's begin out scan by scanning for risky pods in our system by running the following command:
`kubiscan -rp`

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
