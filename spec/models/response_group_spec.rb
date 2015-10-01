require 'rails_helper'
describe ResponseGroup do
  fixtures :response_groups
  describe 'response group model methods' do

    it 'should have the response group parameters set' do
      response_groups(:response_group1).survey_id.should == 3
      response_groups(:response_group2).survey_id.should == 5
      response_groups(:response_group1).updated_at.should == "04-05-2015"
      response_groups(:response_group2).created_at.should == "12-03-2015"
    end

  end
end
