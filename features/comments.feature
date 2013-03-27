Feature: Comments
  Background:
    Given the following user:
      | name                  | dan             |
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
      | admin                 | true            |
    And that user is logged in

  Scenario: Create new comment
    Given I am on the home page
    When I follow "Comments"
    And I follow "click here"
    And I fill in the following:
      | comment_body   | This is a great site! |
      | comment_author | Dan                   |
    And I press "Submit Comment"
    Then I should see "Thank you for your comment!"

  Scenario: Approve Comment
    Given the following comment:
      | body   | This is a great site! |
      | author | Dan                   |
    And I am on the comments page
    When I follow "Approve"
    Then I should see "Comment approved."
    And I should see "This is a great site!"

  Scenario: Delete Comment
    Given the following comment:
      | body   | This is a great site! |
      | author | Dan                   |
    And I am on the comments page
    When I follow "Delete"
    Then I should see "Comment deleted."
    And I should not see "This is a great site!"
