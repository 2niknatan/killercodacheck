## Associated Any Roles Subject Scan

Now that we know that `kubiscan-sa` is a risky service account we can check which ClusterRole/Role is associated with it through the following command:
`kubiscan -aars kubiscan-sa -k serviceaccount`

We recieved the rules associated with kubiscan-sa:

```
Roles associated to Subject 'kubiscan-sa':
+-------------+-----------+----------------------+--------------------------------------------------------------------------------+
| Kind        | Namespace | Name                 | Rules                                                                          |
+-------------+-----------+----------------------+--------------------------------------------------------------------------------+
| ClusterRole | None      | kubiscan-clusterrole | (get,list)->(roles,clusterroles,rolebindings,clusterrolebindings,pods,secrets) |
|             |           |                      |                                                                                |
+-------------+-----------+----------------------+--------------------------------------------------------------------------------+
```