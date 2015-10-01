class CreateResponseGroups < ActiveRecord::Migration
  def change
    create_table :response_groups do |t|
      t.integer :survey_id
      t.timestamps
    end
  end
end
