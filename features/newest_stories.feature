Feature: Newest stories
  In order to get a good laugh
  As a user
  I want to see the latest stories

  Scenario: normal
    Given the following stories:
      | title  | body                  |
      | Story1 | this is a great story |
      | Story2 | this is a so-so story |
    When I visit the home page
    Then I should see the newest story first


