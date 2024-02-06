## Scanning Risky Subjects

The pod `mypod` was marked as CRITICAL because of a service account named `kubiscan-sa`, but we want to understand why this service account is privileged.

To scan risky subject run the following command:
`kubiscan -rs -ns default`

and we get that `kubiscan-sa` is indeed risky subject (ServiceAccount in this case):
```
+-----------+
|Risky Users|
+----------+----------------+-----------+-------------+
| Priority | Kind           | Namespace | Name        |
+----------+----------------+-----------+-------------+
| CRITICAL | ServiceAccount | default   | kubiscan-sa |
+----------+----------------+-----------+-------------+
```

Let's keep on investigating.
