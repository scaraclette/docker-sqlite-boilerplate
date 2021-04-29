# docker-sqlite-boilerplate
Sqlite3 boilerplate for CSS475

1. Run docker-compose detached mode
```
docker-compose up -d
```
2. Get container id
```
docker ps
```
2. Run bash with container id
```
docker exec -it <container-id> bash
``` 
3. Run sqlite3 in env folder to test if it's working. Exit with ctrl-D.
```
sqlite3
```
4. Pull down docker
```
docker-compose down
```

***

## Tutorial for simple database
https://www.sqlitetutorial.net/sqlite-sample-database/ src already contains chinook.db or sample database. Run database in bash on env directory.
```
sqlite3 chinook.db
```
***

