Feature: Vote on stories
  In order to share my opinions
  As a user
  I want to upvote and downvote stories

  @javascript
  Scenario: upvoting
    Given the following story:
      | title | Story1                |
      | body  | this is a great story |
      | id    | 42                    |
    And the following story:
      | title | Story2                |
      | body  | this is a so-so story |
      | id    | 69                    |
    And the following user:
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
    And I should see "0 votes" within the story with id=42
    When I click on "upvote-42"
    Then I should be on the home page
    And I should see "1 votes" within the story with id=42

