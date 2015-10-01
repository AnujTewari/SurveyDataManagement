require 'rails_helper'
describe Survey do
  fixtures :surveys
  describe 'survey model methods' do
    it 'should have the survey parameters set' do
      surveys(:survey_1).survey_name.should == "Survey1"
      surveys(:survey_2).surveyor_name.should == "MrY"
      surveys(:survey_1).description.should == "First survey"
      surveys(:survey_2).created_at.should == "05-05-2015"
    end

    it 'should generate csv' do
      #@values = surveys(:survey_1).to_csv1
      #Survey.to_csv1
      #users(:user1).admin.should == 1
      #users(:user2).make_admin
      #users(:user2).admin.should == 1
    end
  end
end
