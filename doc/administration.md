# Administrating your environment

## Database

Dump a database (using MySQL):

```sh
  mysqldump lepra2_development -u lepra -plepra2  > lepra2.sql
```

and to reconstruct

```sh
  mysql -u lepra -plepra2 lepra2_development < lepra2.sql
```
