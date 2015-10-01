Feature: Survey taker should have Login

Scenario: Successful Login
    Given I am not logged in
    And I am on the surveys home page
    Then I should see "Log in"
    When I fill in "Email" with "user@surveybuilder.com"
    When I fill in "Password" with "user1234"
    When I press "Log in"
    Then I should see "Signed in successfully."
    Then I should not see "Create New Survey"
    Then I should not see "Survey Results"

 