Feature: Admin can manually add users to Surveys

Background:

  Given root is logged in
  When I follow "Manage Users"
  Then I should be on the Manage Users page
  When I follow "Add Users"
  Then I should be on the Create New User page
  When I fill in "Email/UserName" with "testuser@surveybuilder.com"
  And I fill in "Password" with "testuser123"
  And I fill in "Password confirmation" with "testuser123"
  And I select "User" from "User Type"
  And I press "Save Changes"
  Then I should be on the Manage Users page
  And I should see "testuser@surveybuilder.com"
  Then I follow "Home"


Scenario: Add a user to survey

  When I follow "Add Surveys to Users"
  Then I should be on the Survey Users Page
  When I follow "testuser@surveybuilder.com"
  Then I should be on the alloted surveys page for testuser@surveybuilder.com
  When I press "Add Survey"
  Then I should see "Successfully Added."
