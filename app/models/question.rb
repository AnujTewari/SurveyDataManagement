class Question < ActiveRecord::Base
  attr_accessible :survey_id, :question, :response_values, :response_type, :dependency
  #enum response_type: [:multiple_choice, :yes_or_no, :open_ended]
  validates :question, :presence => true
  validates :response_values, :presence => true, if: :responsevalue_check?
  def responsevalue_check?   
   response_type == "Multiple Choice"
  end    
  #end
end
