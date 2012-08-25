require "#{Rails.root}/db/migration_helper"

class CreateEvents < ActiveRecord::Migration

  def up 
    # Create the user table
    create_table :events, {id: false} do |t|

      # Base event information
      t.column :name, "varchar(127)", {null: false}
      t.column :description, "text", {null: false}
      t.column :location, "varchar(127)", {null: false}
      t.column :start_time, "timestamp", {null: false}
      t.column :end_time, "timestamp", {null: true}

      # Extra metadata
      t.column :facebook_eid, "varchar(127)", {null: true}

      # For Google Maps use, and general richness
      t.column :position_lat, "float", {null: true}
      t.column :position_lng, "float", {null: true}

    end

    # Helper Methods
    MigrationHelper.created_updated_columns self, :events 
    MigrationHelper.primary_key self, :events, :event_id

  end

  def down
    drop_table :events
  end
end
