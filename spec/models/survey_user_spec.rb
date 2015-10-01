require 'rails_helper'
describe SurveyUser do
  fixtures :survey_users
  describe 'survey users model methods' do
    it 'should have the survey users parameters set' do
      survey_users(:survey_user1).survey_name.should == "Survey1"
      survey_users(:survey_user2).email.should == "user2@surveybuilder.com"
      survey_users(:survey_user1).userid.should == 2
      survey_users(:survey_user2).surveyid.should == 5
    end
  end
end
