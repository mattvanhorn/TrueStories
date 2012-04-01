Feature: Story upload
  In order to share my experience
  As a user
  I want to upload a story

  Background:
    Given the following stories:
      | title  | body                  |
      | Story1 | this is a great story |
      | Story2 | this is a so-so story |

  Scenario: normal upload
    When I visit the new story page
    And I fill in "Title" with "Story3"
    And I fill in "Body" with "this is a newer story"
    And I click on "Create Story"
    Then I should be on the home page
    And I should see "Story3"

  Scenario: failed upload - missing body
    When I visit the new story page
    And I fill in "Title" with "Story3"
    And I click on "Create Story"
    Then I should be on the new story page
    And I should see "can't be blank" within the input for body

  Scenario: failed upload - missing title
    When I visit the new story page
    And I fill in "Body" with "this is a newer story"
    And I click on "Create Story"
    Then I should be on the new story page
    And I should see "can't be blank" within the input for title
