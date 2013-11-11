Feature: Blurbs
  Background:
    Given the following user:
      | name                  | dan             |
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
      | admin                 | true            |
    And that user is logged in
    And the following page:
      | name     | test |
      | body     | test |
      | category | text |
    And the following blurb:
      | name | sample blurb |
      | body | blurbity     |

  Scenario: Create new blurb
    Given I am on the home page
    And I follow "Blurbs"
    And I follow "New Blurb"
    And I fill in the following:
      | blurb_name | blurbity     |
      | blurb_body | sample blurb |
    And I press "Create Blurb"
    Then I should see "Blurb successfully created."
    And I should see "blurbity"

  Scenario: Update Blurb
    Given I am on the blurbs page
    When I follow "Edit"
    And I fill in the following:
      | blurb_name | changed name |
    And I press "Update Blurb"
    Then I should see "Blurb successfully updated."
    And I should see "changed name"

  Scenario: Delete Blurb
    Given I am on the blurbs page
    When I follow "Delete"
    Then I should see "Blurb successfully deleted."
    And I should not see "sample blurb"

  Scenario: Attach a blurb to a page
    Given I am on that page
    When I follow "Edit"
    And I select the following:
      | Blurb | sample blurb |
    And I press "Update Page"
    Then I should see "blurbity"
