## Associated Any Roles Subject Scan

Now that we know that `kubiscan-sa` is a risky service account we can check which ClusterRole/Role is associated with it through the following command:
<code>kubiscan -aars kubiscan-sa -k serviceaccount</code>

We recieved the rules associated with `kubiscan-sa`:

```
Roles associated to Subject 'kubiscan-sa':
+-------------+-----------+----------------------+--------------------------------------------------------------------------------+
| Kind        | Namespace | Name                 | Rules                                                                          |
+-------------+-----------+----------------------+--------------------------------------------------------------------------------+
| ClusterRole | None      | kubiscan-clusterrole | (get,list)->(roles,clusterroles,rolebindings,clusterrolebindings,pods,secrets) |
|             |           |                      |                                                                                |
+-------------+-----------+----------------------+--------------------------------------------------------------------------------+
```

We can clearly see that `kubiscan-sa` is associated with ClusterRole named `kubiscan-clusterrole` that has permission to get and list secrets which are considered as high privileges. This is also the reason why it was marked as CRITICAL previously when we looked over the risky subjects.
