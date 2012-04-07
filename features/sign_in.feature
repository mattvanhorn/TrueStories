Feature: Sign In
  In order to vote on a story
  As a user
  I want to sign in

  Scenario: identity sign up
    When I visit the sign up page
    And I fill in "Name" with "Alice"
    And I fill in "Email" with "alice@example.com"
    And I fill in "Password" with "password1"
    And I fill in "Password confirmation" with "password1"
    And I click on "Register"
    Then I should be on the home page
    And I should see "Alice"

  Scenario: identity sign in
    Given the following user:
    | nickname              | Alice             |

    And the following identity:
    | name                  | Alice             |
    | email                 | alice@example.com |
    | password              | password1         |
    | password_confirmation | password1         |

    When I visit the sign in page
    And I fill in "Login" with "alice@example.com"
    And I fill in "Password" with "password1"
    And I click on "Connect"
    Then I should be on the home page
    And I should see "Alice"

  # Scenario: twitter sign in
  # When I visit the home page
  # And I click on "Sign in with Twitter"
  # Then I should be on the home page


