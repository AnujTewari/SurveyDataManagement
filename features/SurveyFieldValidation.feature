Feature: Survey Fields can't be empty

Scenario: Survey Name can't be empty
  Given I am logged in
  And I am on the Create New Survey page
  When I fill in "Surveyor Name" with "Mr. XYZ"
  And I fill in "Survey Description" with "Details"
  And I press "Save Changes"
  And I should see "Error:" 

Scenario: Surveyor Name can't be empty
  Given I am logged in
  And I am on the Create New Survey page
  When I fill in "Survey Name" with "XYZ"
  And I fill in "Survey Description" with "Details"
  And I press "Save Changes"
  And I should see "Error:" 
  

