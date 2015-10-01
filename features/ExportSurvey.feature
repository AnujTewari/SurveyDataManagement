Feature: Export survey data in CSV format 

Scenario: Download reponses from a Survey
  Given I am logged in
  When I follow "Survey Results"
  Then I should get a download with the filename "Class Survey Results"

  Scenario: Download all Surveys in CSV
  Given I am logged in
  When I follow "Survey Results"
  Then I should get a download with the filename "Class Survey Results"