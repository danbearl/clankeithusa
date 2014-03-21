Feature: Pages
  Background:
    Given the following user:
      | name                  | dan             |
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
      | admin                 | true            |
    And that user is logged in

  Scenario: Create New Page
    Given I am on the pages index
    When I follow "New Page"
    And I fill in the following:
      | page_name | about                   |
      | page_body | This is the about page. |
    And I press "Create Page"
    Then I should see "Page successfully created."
    And I should see "about"

  Scenario: Edit Page
    Given the following page:
      | name     | about                   |
      | body     | This is the about page. |
      | category | text                    |
      | draft    | false                   |
    And I am on that page
    When I follow "Edit"
    And I fill in the following:
      | page_body | This is the updated about page. |
    And I press "Update Page"
    Then I should see "Page successfully updated."
    And I should see "This is the updated about page."

  Scenario: Delete Page
    Given the following page:
      | name     | about                   |
      | body     | This is the about page. |
      | category | text                    |
      | draft    | false                   |
    And I am on that page
    When I follow "Delete"
    Then I should see "Page successfully deleted."

  Scenario: Gallery Page
    Given the following page:
      | name     | gallery              |
      | body     | A fun little gallery |
      | category | gallery              |
      | draft    | false                |
    And the following image:
      | name    | test image |
      | page_id | 1          |
    And I am on that page
    Then I should see "A fun little gallery"
    And I should see "test image"

  Scenario: Archive Page
    Given the following page:
      | name     | archive              |
      | body     | A fun little archive |
      | category | archive              |
      | draft    | false                |
    And the following document:
      | name    | Issue 1 |
      | page_id | 1       |
    And I am on that page
    Then I should see "Issue 1"

  Scenario: Draft pages do not appear on the site
    Given the following page:
      | name      | sample               |
      | body      | this is a draft page |
      | parent_id | 0                    |
      | draft     | true                 |
    And I am on the home page
    Then I should not see "sample"

  Scenario: Draft pages do appear in the pages index
    Given the following page:
      | name      | sample               |
      | body      | this is a draft page |
      | category  | section              |
      | parent_id | 0                    |
      | draft     | true                 |
    And I am on the pages index
    Then I should see "sample"
