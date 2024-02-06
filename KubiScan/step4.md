## Risky Roles & ClusterRoles Scan

We will use the following command to scan for risky Roles/ClusterRoles by running:
`kubiscan -rar`

```
+----------------------------+
|Risky Roles and ClusterRoles|
+----------+-------------+-------------+---------------------------------------------+-----------------------------------+
| Priority | Kind        | Namespace   | Name                                        | Creation Time                     |
+----------+-------------+-------------+---------------------------------------------+-----------------------------------+
| CRITICAL | ClusterRole | None        | kubiscan-clusterrole                        | Tue Feb  6 09:02:32 2024 (0 days) |
+----------+-------------+-------------+---------------------------------------------+-----------------------------------+
```

We received a list of risky roles and cluster roles, one of them is `kubiscan-clusterrole`, the same role we saw previously associated with `kubiscan-sa`.

Now we want to find which RoleBinding/ClusterRoleBinding is bound to `kubiscan-sa` service account, so let's keep investigating.
