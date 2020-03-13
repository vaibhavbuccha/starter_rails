# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
----------------------------
#### Access mysql databases

* for auth
```bash
mysql -u root -p 

```
* for see all databases
```bash
show databases;
```

* for use an database
```bash
use dbname;
```
* for show all tables of a db
```bash
show tables;
```

* for show fields of a table
```bash

show fields from table_name;

```

* show table data

```bash

select * from table_name;
```
----------------------------

### rails generate database 

```bash
rails db:create
```

### rails start server

```bash
rails server
```


### create controller and view in rails

```bash
rails generate controller controller_name view_name
```
> it create and controller and a view folder with view file 

## Migrations
---
### create migration 

```bash

rails generate migration migration_name

```
> it creates migration file in db > migration_file


### create model 
```bash

rails generate model model_name

```
> it generates 2 thing one is model and another one is migration file also.

### migrate db 
```bash

rails db:migrate

```

### roleback, revert, remove migration

```bash

rails db:migrate VERSION=0
```

| Tables_in_myapp_development |
|-----------------------------|
| ar_internal_metadata        |
| schema_migrations           |



### check status of migration
```bash

rails db:migrate:status

```
| *Status* |  *Migration ID*  |  *Migration Name*
|--------|----------------|------------------------
|  down  | 20200312105632 | Do nothing
|  down  | 20200312110153 | Create users

### run a specific migration

```bash

rails db:migrate VERSION=version_no

```


---

