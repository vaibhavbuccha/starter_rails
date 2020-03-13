class ChangeUsers < ActiveRecord::Migration[6.0]
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
  def up
    rename_table('users','admin_users')
    add_column('admin_users','username',:string,:limit => 25,:after=>'email')
    change_column('admin_users','email',:string,:limit=>25)
    rename_column('admin_users','password','hashed_password')
    add_index('admin_users','username')
  end

  def down
    remove_column('admin_users','username',:string,:limit => 25,:after=>'email')
    change_column('admin_users','email',:string,:limit=>25,:default=>'',:null=>false)
    rename_column('admin_users','hashed_password','password')
    remove_index('admin_users','username')
    rename_table('admin_users','users')
  end


end
