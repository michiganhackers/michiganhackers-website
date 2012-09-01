class AddUserLoginTracking < ActiveRecord::Migration
  def up
    
    change_table :users do |t|
      
      # User Log In and Activation Tracking
      t.column :last_login, "timestamp", {after: :password_hash}
      t.column :reset_password, :boolean, {after: :password_hash, null: false, default: false}
      t.column :is_active, :boolean, {after: :password_hash, null: false, default: false}
      t.column :confirmation_hash, "varchar(63)", {after: :password_hash, null: true, default: nil}
      
    end
    
    # Enforce uniqueness on the confirmation hash
    add_index(:users, :confirmation_hash, {unique: true})
    
  end

  def down

    remove_column :users, :last_login
    remove_column :users, :reset_password
    remove_column :users, :is_active
    remove_column :users, :confirmation_hash
  end
end
