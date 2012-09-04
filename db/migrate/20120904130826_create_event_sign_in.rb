require "#{Rails.root}/db/migration_helper"

class CreateEventSignIn < ActiveRecord::Migration
  def up

    create_table :event_sign_ins, {id: false} do |t|
      
      # Base tracking info
      t.column :user_id, "integer(11) unsigned", {null: false}
      t.column :eid, "varchar(31)", {null: false}
      
    end

    MigrationHelper.created_updated_columns self, :event_sign_ins
    MigrationHelper.primary_key self, :event_sign_ins, :event_sign_in_id

  end

  def down
    drop_table :event_sign_ins
  end
end
