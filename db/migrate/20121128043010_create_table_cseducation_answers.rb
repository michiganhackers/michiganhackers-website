require "#{Rails.root}/db/migration_helper"

class CreateTableCseducationAnswers < ActiveRecord::Migration
  def up

    # Create the user table
    create_table :cseducation_answers, {id: false} do |t|

			# The answer value
      t.column :value, "integer(11) unsigned", {null: false}

			# Uniqname and Question ID
      t.column :uniqname, "varchar(15)", {null: false, default: ""}
      t.column :qid, "varchar(63)", {null: false, default: ""}

    end

    # Helper Methods
    MigrationHelper.created_updated_columns self, :cseducation_answers 
    MigrationHelper.primary_key self, :cseducation_answers, :cseducation_answer_id
  end

  def down
    drop_table :cseducation_answers
  end
end
