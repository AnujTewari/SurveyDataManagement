class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer 'survey_id'      
      t.text 'question'
      t.string 'response_type'
      t.string 'response_values'
    end
  end
end
