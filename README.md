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

### migration methods

#### running up and down methods
```bash
rails db:migrate:up VERSION=version_no

rails db:migrate:down VERSION=version_no
```

### basic migration functions

```rb
=begin
  
  some basic methods for migration or database changes

  rename table name  =>  rename_table('current_table_name','new_table_name')
  add column in table => add_column('tbl_name','column_name','datatype','limit','default'.... etc ,':after => column_name')
  change column => change_column('tbl_name','column_name',characterstic.......)
  rename column => rename_column('tbl_name','current_column_name','new_column_name')
  add index => add_index('tbl_name','column_name')
  remove column => remove_column('tbl_name','column_name')
  remove index => remove_index('tbl_name','column_name') 

=end
```
> nameing convention in ruby the model name is similar to the migration table name else it throught error but we can handle this via 2 ways first using code in model mention bellow.

```rb
class User < ApplicationRecord

    self.table_name = "admin_users"
end
```
> otherwise we have to change the file name and model name

```rb
class AdminUser < ApplicationRecord

    # self.table_name = "admin_users"
end
```

---
## Rails console
---
* rails console is work like interactive ruby.but in addition with irb we can run here ruby and rails both codes. 


* open rails console => type the bellow command in terminal for get enter in rails console

```rail
rails console
```

* using rails console we can perform database operations link insert update delete records.

> for doing that there is 2 ways available 
1. via creating instance.
2. via calling specific methods.

*1st way* (Create)

**steps 1**
- create instance
```irb
variable = Class.new
```
- assign value to object 
```irb
variable.var = "value"
```
- see value of object variables
```irb
variable.var
```
- assigning values example
```irb
   subject = Subject.new(:name => "maths",:position => 1 ,:visible => true)
```
- for save changes 
```irb
subject.save
```
*2st way* (Create)
```irb
var = Obj.new(:key=>"value")
```

*1st way* (update)
**Note =>** find is only filter form id for using another field we should where

```rails

<!-- find value -->
var = Obj.find()  /   var  =  Obj.where(:key=>"value") 


var.key = "value"

var.save

```
*2st way* (update)

```rails

<!-- find value -->
var = Obj.find()  /   var  =  Obj.where(:key=>"value") 
var.update_attributes(:key => value)

```
*1st way* (delete)
```rails
var = Obj.find()  /   var  =  Obj.where(:key=>"value") 

var.destroy

```
**Note =>** new,create,find,destroy these are active relations these are predefined
---
### Named scopes and Relationship types

- these are defind by user as per there needs

```rb

    # defind scope :visible is the name of the variable and it perform the work which is written in {} 
    scope :visible, lambda {where(:visible => true)}
    # we use it like subject.visible
    scope :invisible, lambda {where(:visible => false)}
    scope :sorted, lambda {order("position ASC")}
    scope :search, lambda {|query| where(["name LIKE ?","%#{query}%"])}

```

---
### REST And Resourceful Apis

> #*REST =>*# representational state transfer
> don't perform procedures
> perform state transformations upon resources

* generate controller and views for REST
```sh
rails generate controller subject index new show edit delete
```
---

### show all routes
```rails
rails routes
```


---

### url creation
```rb
# 1st way
<%= link_to('show', '{subjects/#{subjects.id}}' ) %>

# 2nd way

 <%= link_to('show',{:controller=>"subject",:action=>'show',:id=>subject.id},:class=>'action show') %>

# 3rd way resourcefull routes
<%= link_to('show' , subject_path(subject.id)) %>


```
---

### form helpers

- create form with action methods
```rb
 <%= form_for(@subject, :url => {:controller => 'subjects'} , :method => 'post' ) do |f| %>

        <table>
            <tr>
                <th>Name</th>
                <td>
                    <%= f.text_field(:name) %>
                </td>
            </tr>
            <tr>
                <th>Position</th>
                <td>
                    <%= f.number_field(:position) %>
                </td>
            </tr>
            <tr>
                <th>Visible</th>
                <td>
                     True <%= f.radio_button(:visible , 'true') %>
                     False <%= f.radio_button(:visible , 'false') %>
                </td>
            </tr>
            <tr>
                <td colspan=2>
                   <%= f.submit(:create) %>
                </td>
            </tr>
        </table>

    <%end%>

```
> form_for create form for subject url shows detination where form is submited method shows the mode of submittion. 
> form helpers also helps in craeting fields .
> - some are as follows.
>  <%= f.text_field(:name) %>   =>  <input type="text" name="subject[name]" id="subject_name">
> <%= f.number_field(:position) %>  => <input type="number" name="subject[position]" id="subject_position">
> <%= f.radio_button(:visible , 'true',:checked => true) %><input type="radio" value="true" checked="checked" name="subject[visible]" id="subject_visible_true">

---

### Flash hash
---

> Flash is use for show the message when action is perform flash have ability to store last action.

> Flash is created before the redirection

```rb

  flash[:flash_name] = "message"
  redirect_to(path)

```
> For show the flash message we have to display flash message in view file.

```rb

    <% if !flash[:notice].blank? %>
        <div class='notice' >
            <%= flash[:notice] %>
        </div>
    <%end%>
```

---
### Layouts
---
- create a layout in view/layouts and we can use it as template our main content is placed using yeild.
- and we also have to set template in controller. 


---
### partial template
--- 
> partial template helps us to rewrite the code which is same and uses many places. we can also say that write once use many places. it reduse our code and also not need to change at many places.

###### partial template naming convention 
* file name start with ( _ )  like _form.html.erb


###### render template on a view

```rb 
<%= render(:partial => 'filename' , :locals => {:f => f}  ) %>

=begin
    
    file name is written without ( _ )

    locals give accessability of the variable in partial template like here f is accessable in partial template. 

=end

```



