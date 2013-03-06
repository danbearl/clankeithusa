Feature: Announcements
  Background:
    Given the following user:
      | name                  | dan             |
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
      | admin                 | true            |
    And that user is logged in.

  Scenario: Create a new announcement
    Given I am on the new announcement page
    And I fill in the following:
      | announcement_body | announcement! |
      | announcement_name | test          |
    And I press "Create Announcement"
    Then I should see "Announcement successfully created."
    
  Scenario: Update an announcement
    Given the following announcement:
      | body | announcement! |
      | name | test          |
    And I am on the announcements index page
    When I follow "Edit"
    And I fill in the following:
      | announcement_body | New Announcement! |
    And I press "Update Announcement"
    Then I should see "Announcement successfully updated."
    And I should see "New Announcement!"

  Scenario: Delete an announcement
    Given the following announcement:
      | body | announcement! |
      | name | test          |
    And I am on the announcements index page
    When I follow "Destroy"
    Then I should see "Announcement test was deleted."
    And I should not see "announcement!"

  Scenario: Site wide announcement
    Given the following announcement:
      | body      | announcement! |
      | name      | test          |
      | live      | true          |
      | site_wide | true          |
    And I am on the events page
    Then I should see "announcement!"

  Scenario: Front page announcement
    Given the following announcement:
      | body       | announcement! |
      | name       | test          |
      | live       | true          |
      | site_wide  | false         |
    And I am on the home page.
    Then I should see "announcement!"

  Scenario: Announcement not live
    Given the following announcement:
      | body       | announcement! |
      | name       | test          |
      | live       | false         |
      | site_wide  | false         |
    And I am on the home page.
    Then I should not see "announcement!"
