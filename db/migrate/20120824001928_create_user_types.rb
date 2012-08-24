require "#{Rails.root}/db/migration_helper"

class CreateUserTypes < ActiveRecord::Migration
  def up

    create_table :user_types, {id: false} do |t|

      # Type metadata
      t.column :type_name, "varchar(63)", {null: false}

    end

    MigrationHelper.created_updated_columns self, :user_types
    MigrationHelper.primary_key self, :user_types, :user_type_id

  end

  def down
    
  end
end
