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
    When I visit the sign in page
    And I fill in "Name" with "alice"
    And I fill in "Email" with "alice@example.com"
    And I click on "Sign In"
    Then I should be on the home page
    And I should see "0 votes" within the story with id=42
    When I click on "upvote" within the story with id=42
    Then I should be on the home page
    And I should see "1 votes" within the story with id=42

