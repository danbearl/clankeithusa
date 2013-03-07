Feature: Documents
  Background:  
    Given the following user:
      | name                  | dan             |
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
      | admin                 | true            |
    And that user is logged in.
    And the following page:
      | name | test |
      | body | test |

  Scenario: Create a document
    Given I am on that page
    When I follow "Add Document"
    And I fill in the following:
      | document_name        | Issue 1               |
      | document_description | Our very first issue! |
    And I press "Save"
    Then I should see "Document successfully created"
    And I should see "Issue 1"
