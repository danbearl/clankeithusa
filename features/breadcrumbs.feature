Feature: Page Breadcrumbs
  Scenario: Pages display their breadcrumbs
    Given the following page:
      | name     | main page |
      | body     | some text |
      | category | section   |
      | public   | true      |
    And the following page:
      | name      | sub page  |
      | body      | some text |
      | parent_id | 1         |
      | category  | text      |
      | public    | true      |
    And I am on that page
    Then I should see "main page/ sub page"
