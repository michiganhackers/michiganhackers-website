require "#{Rails.root}/db/migration_helper"

class CreateUsers < ActiveRecord::Migration
  def up

    # Create the user table
    create_table :users, {id: false} do |t|

      # Relations
      t.column :user_type_id, "integer(11) unsigned", {null: false}

      # Name and Email 
      t.column :first_name, "varchar(63)", {null: false, default: ""}
      t.column :last_name, "varchar(63)", {null: false, default: ""}
      t.column :email, "varchar(127)", {null: false}

      # Password
      t.column :password_hash, "varchar(63)", {null: false}

    end

    # Apply Indexes and FK-contraints
    add_index(:users, :email, {unique: true})

    # Helper Methods
    MigrationHelper.created_updated_columns self, :users 
    MigrationHelper.primary_key self, :users, :user_id

  end

  def down
    drop_table :users
  end
end
