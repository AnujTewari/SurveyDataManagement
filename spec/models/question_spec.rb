require 'rails_helper'
describe Question do
  fixtures :questions
  describe 'question model methods' do

    it 'should have the question parameters set' do
      questions(:question_1).survey_id.should == 3
      questions(:question_2).survey_id.should == 5
      questions(:question_1).question.should == "How are you doing today?"
      questions(:question_2).response_type.should == "Open-ended"
      questions(:question_1).response_values.should == "Very good! Thank you"
    end

  end
end
