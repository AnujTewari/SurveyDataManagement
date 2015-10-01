Feature: Admin can manually add survey

Scenario: Add a survey
  Given I am logged in
  Then I should be on the surveys home page
  When I follow "Create New Survey"
  Then I should be on the Create New Survey page
  When I fill in "Survey Name" with "My Test Survey"
  And I fill in "Surveyor Name" with "Mr. XYZ"
  And I fill in "Survey Description" with "Details"
  And I press "Save Changes"
  Then I should be on the surveys home page
  And I should see "My Test Survey"
