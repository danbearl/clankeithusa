Feature: Image
  Background: Admin is signed in
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
      | category | gallery |

  Scenario: Create new image
    Given I am on that page.
    When I follow "Add Image"
    And I fill in the following:
      | image_name        | castle                |
      | image_priority    | 1                     |
      | image_description | a picture of a castle |
    And I press "Save"
    Then I should see "Image successfully uploaded."
    And I should see "castle"

  Scenario: Edit Image
    Given the following image:
      | name        | castle                |
      | priority    | 1                     |
      | description | a picture of a castle |
      | page_id     | 1                     |
    And I am on that page.
    When I follow "Edit Image"
    And I fill in the following:
      | image_name | Castle |
    And I press "Save"
    Then I should see "Image successfully updated."
    And I should see "Castle"

  Scenario: Delete Image
    Given the following image:
      | name        | castle                |
      | priority    | 1                     |
      | description | a picture of a castle |
      | page_id     | 1                     |
    And I am on that page.
    When I follow "Delete Image"
    Then I should see "Image successfully deleted."
    And I should not see "castle"
