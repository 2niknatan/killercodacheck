## Risky RolesBindings and ClusterRoleBindings Scan

First, we scan for risky Roles/ClusterRoles by running the following command:
`kubiscan -rab`


we will receive a list of all risky RoleBindings and ClusterRoleBinding and one of them is `kubiscan-clusterrolebinding` and should look as follows:
```
+------------------------------------------+
|Risky RoleBindings and ClusterRoleBindings|
+----------+--------------------+-------------+---------------------------------------------+-----------------------------------+
| Priority | Kind               | Namespace   | Name                                        | Creation Time                     |
+----------+--------------------+-------------+---------------------------------------------+-----------------------------------+
| CRITICAL | ClusterRoleBinding | None        | kubiscan-clusterrolebinding                 | Tue Feb  6 11:28:13 2024 (0 days) |
+----------+--------------------+-------------+---------------------------------------------+-----------------------------------+
```

We can see that kubiscan-clusterrolebinding is indeed risky and prioritized as **CRITICAL**. The reason for that is because this role binding contains a role with high privileges rules. This still doesn’t mean it is bonded to kubiscan-sa. To find the associated role binding to kubiscan-sa we will need a different command.