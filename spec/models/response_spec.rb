require 'rails_helper'
describe Response do
  fixtures :responses
  describe 'response model methods' do

    it 'should have the response parameters set' do
      responses(:response_1).response_group.should == 1
      responses(:response_2).question_id.should == 5
      responses(:response_1).answer_text.should == "First survey"
      responses(:response_2).created_at.should == "05-05-2015"
    end

  end
end
