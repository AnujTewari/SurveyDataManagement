class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer_group

  attr_accessible :response_group, :question_id, :answer_text  
end
