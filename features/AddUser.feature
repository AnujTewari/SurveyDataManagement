Feature: Admin can manually add users

Scenario: Adding an user by admin 
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

