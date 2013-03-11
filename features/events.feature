Feature: Event
  Background: Admin logged in
    Given the following user:
      | name                  | dan             |
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
      | admin                 | true            |
    And that user is logged in.

  Scenario: Create an event
    Given the date is "2013-03-11"
    And I am on the events page.
    When I follow "New"
    And I fill in the following:
      | event_title       | meeting                |
      | event_description | Be there or be square. |
      | event_starts_at   | 2013-03-11             |
      | event_ends_at     | 2013-03-11             |
    And I press "Create Event"
    Then I should see "Event successfully created."
    And I should see "Be there or be square."


  Scenario: Update an event
    Given the date is "2013-03-11"
    And the following event:
      | title       | meeting               |
      | description | Be there or be square |
      | starts_at   | 2013-03-11            |
      | ends_at     | 2013-03-11            |
    And I am on the events page.
    When I follow "Edit"
    And I fill in the following:
      | event_description | Bring your own food. |
    And I press "Update Event"
    Then I should see "Event successfully updated."
    And I should see "Bring your own food."

  Scenario: Delete an event
    Given the date is "2013-03-11"
    And the following event:
      | title       | meeting               |
      | description | Be there or be square |
      | starts_at   | 2013-03-11            |
      | ends_at     | 2013-03-11            |
    And I am on the events page.
    When I follow "Destroy"
    Then I should see "Event successfully deleted."
    And I should not see "Be there or be square"
  
  Scenario: Dates out of default range
    Given the date is "2013-04-13"
    And the following event:
      | title       | meeting               |
      | description | Be there or be square |
      | starts_at   | 2013-03-11            |
      | ends_at     | 2013-03-11            |
    And I am on the events page.
    Then I should not see "Be there or be square"

  Scenario: Change filtered date range
    Given the date is "2013-04-13"
    And the following event:
      | title       | meeting               |
      | description | Be there or be square |
      | starts_at   | 2013-03-11            |
      | ends_at     | 2013-03-11            |
    And I am on the events page.
    When I fill in the following:
      | start | 2013-03-01 |
      | end   | 2013-03-30 |
    And I press "Filter Events"
    Then I should see "Be there or be square"
