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
      | name     | test    |
      | body     | test    |
      | category | archive |

  Scenario: Create a document
    Given I am on that page.
    When I follow "Add Document"
    And I fill in the following:
      | document_name        | Issue 1               |
      | document_description | Our very first issue! |
    And I press "Save"
    Then I should see "Document successfully created"
    And I should see "Issue 1"

  Scenario: Update a document
    Given the following document:
      | name        | Issue 1               |
      | description | Our very first issue! |
      | page_id     | 1                     |
    And I am on that page.
    When I follow "Edit Document"
    And I fill in the following:
      | document_description | A very rad read! |
    And I press "Update Document"
    Then I should see "Document successfully updated."
    And I should see "A very rad read!"

  Scenario: Delete a document
    Given the following document:
      | name        | Issue 1               |
      | description | Our very first issue! |
      | page_id     | 1                     |
    And I am on that page.
    When I follow "Delete Document"
    Then I should see "Document successfully deleted."
    And I should not see "Our very first issue!"
