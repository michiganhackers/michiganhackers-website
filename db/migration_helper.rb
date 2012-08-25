module MigrationHelper

  def self.created_updated_columns scope, table_name_sym
    scope.execute "ALTER TABLE `#{table_name_sym.to_s}` ADD `created_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00';"
    scope.execute "ALTER TABLE `#{table_name_sym.to_s}` ADD `created_by` integer(11) unsigned NOT NULL DEFAULT 0;"

    scope.execute "ALTER TABLE `#{table_name_sym.to_s}` ADD `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;"
    scope.execute "ALTER TABLE `#{table_name_sym.to_s}` ADD `updated_by` integer(11) unsigned NOT NULL DEFAULT 0;"
  end

  def self.primary_key scope, table_name_sym, column_name_sym
   scope.execute "ALTER TABLE `#{table_name_sym.to_s}` ADD COLUMN `#{column_name_sym.to_s}` integer(11) unsigned AUTO_INCREMENT PRIMARY KEY FIRST;" 
  end

end
