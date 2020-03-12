class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      # long method
      t.column 'first_name',:string,:limit => 25
      #short method
      t.string 'last_name',:limit => 25
      t.string 'email',:default=>'',:null => false
      t.string 'password',:limit => 25
      
      t.timestamps
      #  t.timestamps means 

      # t.datetime "created_at"
      # t.datetime "updated_at"

    end
  end

  def down
    drop_table :users
  end
end
