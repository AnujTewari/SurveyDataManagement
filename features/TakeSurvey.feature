Feature: Taking a survey

Background:

  Given I am logged in

  When I follow "Create New Survey"
  Then I should be on the Create New Survey page
  When I fill in "Survey Name" with "My Test Survey"
  And I fill in "Surveyor Name" with "Mr. XYZ"
  And I fill in "Survey Description" with "Details"
  And I press "Save Changes"
  Then I should be on the surveys home page
  When I follow "My Test Survey"
  Then I should be on the Questions page for My Test Survey
  When I follow "Create New Question"
  Then I should be on the New Questions page for My Test Survey
  When I fill in "questionInput" with "Cucumber Question"
  And I select "Open Ended" from "Response Type"
  And I fill in "Response Values" with "Open ended Response"
  And I press "Save Changes"
  Then I should be on the Questions page for My Test Survey
  And I should see "Cucumber Question"
  Then I follow "Home"

  When I follow "Add Surveys to Users"
  Then I should be on the Survey Users Page
  When I follow "user@surveybuilder.com"
  Then I should be on the alloted surveys page for user@surveybuilder.com
  And I select "3,My Test Survey" from "Survey Name"
  When I press "Add Survey"
  Then I should see "Successfully Added."
  When I sign out
  Then I should see "Log in"

Scenario:
  Given User is logged in
  Then I should be on the surveys home page
  When I follow "Take the survey"
#  Then I should be on the Response page for My Test Survey
  When I fill in "Cucumber Question" with "My Response"
  And I press "Save Changes"
  Then I should see "Survey Response Summary"
  And I follow "Confirm Submission"
  Then I should see "submitted"