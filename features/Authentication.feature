Feature: Admin should have Login

Scenario: Successful Login
    Given I am not logged in
    And I am on the surveys home page
    Then I should see "Log in"
    When I sign in with valid credentials
    Then I should see "Signed in successfully."
    
Scenario: Unsuccessful Login
    Given I am not logged in
    And I am on the surveys home page
    Then I should see "Log in"
    When I fill in "Email" with "wrong@email.com"
    When I fill in "Password" with "wrong password"
    When I press "Log in"
    Then I should see "Log in"    
