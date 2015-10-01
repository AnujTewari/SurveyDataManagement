class SurveyUser < ActiveRecord::Base
  attr_accessible :userid, :surveyid , :survey_name, :email
end
