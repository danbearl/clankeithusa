Feature: Blurbs
  Background:
    Given the following user:
      | name                  | dan             |
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
      | admin                 | true            |
    And that user is logged in.
    And the following page:
      | title | test |
      | body  | test |

  Scenario: Create new blurb
    Given I am on that page.
    And I follow "Add Blurb"
    And I fill in the following:
      | blurb_name | blurb        |
      | blurb_body | sample blurb |
    And I press "Create Blurb"
    Then I should see "Blurb successfully created."
    And I should see "sample blurb"

  Scenario: Update Blurb
    Given I am on that page.
    And the following blurb:
      | name | blurb        |
      | body | sample blurb |
    And I follow "Edit Blurb"
    And I fill in the following:
      | blurb_body | changed content |
    And I press "Update Blurb"
    Then I should see "Blurb successfully updated."
    And I should see "changed content"
