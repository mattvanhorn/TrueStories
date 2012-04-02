Feature: Sign In
  In order to vote on a story
  As a user
  I want to sign in

  Scenario: normal
    When I visit the sign in page
    And I fill in "Name" with "alice"
    And I fill in "Email" with "alice@example.com"
    And I click on "Sign In"
    Then I should be on the home page
    And I should see "alice@example.com"


