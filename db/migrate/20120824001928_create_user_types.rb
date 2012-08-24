require "#{Rails.root}/db/migration_helper"

class CreateUserTypes < ActiveRecord::Migration
  def up

    create_table :user_types, {id: false} do |t|

      # Type metadata
      t.column :type_name, "varchar(63)", {null: false}

    end

    MigrationHelper.created_updated_columns self, :user_types
    MigrationHelper.primary_key self, :user_types, :user_type_id

    execute "INSERT INTO `user_types` (`user_type_id`, `type_name`, `created_at`) VALUES (1, 'student', NULL);"
    execute "INSERT INTO `user_types` (`user_type_id`, `type_name`, `created_at`) VALUES (2, 'educator', NULL);"
    execute "INSERT INTO `user_types` (`user_type_id`, `type_name`, `created_at`) VALUES (3, 'company', NULL);"

  end

  def down
    drop_table :user_types    
  end
end
