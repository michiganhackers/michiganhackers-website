class CreateUsers < ActiveRecord::Migration
  def up

    # Create the user table
    create_table :users, {id: false} do |t|

      # Name and Email 
      t.column :first_name, "varchar(63)", {null: false, default: ""}
      t.column :last_name, "varchar(63)", {null: false, default: ""}
      t.column :email, "varchar(127)", {null: false}

      # Password
      t.column :password_hash, "varchar(63)", {null: false}

      # Utility columns
      t.column :created_by, "integer(11) unsigned", {null: false, default: 0}
      t.column :updated_by, "integer(11) unsigned", {null: false, default: 0}
    end

    # Apply Indexes and FK-contraints
    add_index(:users, :email, {unique: true})

    # Adding these in by hand - ActiveRecord::Migration isn't quite this good...
    execute "ALTER TABLE `users` ADD COLUMN `user_id` integer(11) unsigned AUTO_INCREMENT PRIMARY KEY FIRST;"
    execute "ALTER TABLE `users` ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `created_by`;"
    execute "ALTER TABLE `users` ADD `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' AFTER `updated_by`;"

  end

  def down
    drop_table :users
  end
end
