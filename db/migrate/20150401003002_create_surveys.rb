class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string 'survey_name'
      t.string 'surveyor_name'
      t.text 'description'
      # Add fields that let Rails automatically keep track
      # of when surveys are added or modified:
      t.timestamps
    end
  end
end
