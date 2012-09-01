require "#{Rails.root}/db/migration_helper"

class CreateUserDetails < ActiveRecord::Migration
  def up
    create_table :user_details, {id: false} do |t|

      # Relations
      t.column :user_id, "integer(11) unsigned", {null: false}

      # Metadata fields
      t.column :concentration, "varchar(127)", {null: false}
      t.column :graduation_date, "date", {null: false}
      t.column :github_handle, "varchar(63)"
      t.column :personal_url, "varchar(127)"

    end

    add_index(:user_details, :user_id, {unique: true})

    MigrationHelper.created_updated_columns self, :user_details
    # MigrationHelper.primary_key self, :user_details, :user_detail_id

  end

  def down
    drop_table :user_details
  end
end
