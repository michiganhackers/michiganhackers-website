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

      # Utility columns
      t.column :created_by, "integer(11) unsigned", {null: false, default: 0}
      t.column :updated_by, "integer(11) unsigned", {null: false, default: 0}
    end

    # Apply Indexes and FK-contraints

    # Adding these in by hand - ActiveRecord::Migration isn't quite this good...
    execute "ALTER TABLE `events` ADD COLUMN `event_id` integer(11) unsigned AUTO_INCREMENT PRIMARY KEY FIRST;"
    execute "ALTER TABLE `events` ADD `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `created_by`;"
    execute "ALTER TABLE `events` ADD `updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' AFTER `updated_by`;"
  end

  def down
    drop_table :events
  end
end
