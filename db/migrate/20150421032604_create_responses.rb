class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :response_group
      t.integer :question_id
      t.text :answer_text
      t.timestamps
    end
  end
end
