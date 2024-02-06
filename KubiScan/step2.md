## Scanning Risky Subjects Scan

The pod `mypod` was marked as CRITICAL because of a service account named `kubiscan-sa`, but we want to understand why this service account is privileged.

To scan risky subject run the following command:
<code>kubiscan -rs -ns default</code>

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

The command lists all the risky subjects which can be a user, group, or service account that has high-privilege roles.

Let's keep on investigating.
