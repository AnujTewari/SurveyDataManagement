class ResponseGroup < ActiveRecord::Base
  belongs_to :survey
  has_many :responses

  attr_accessible :survey_id  
end
