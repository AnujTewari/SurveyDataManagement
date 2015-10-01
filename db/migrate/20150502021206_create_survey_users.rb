class CreateSurveyUsers < ActiveRecord::Migration
  def change
    create_table :survey_users do |t|
      t.integer 'userid'
      t.integer 'surveyid'
      t.string 'email'
      t.string 'survey_name'
      t.timestamps null: false
    end
  end
end
