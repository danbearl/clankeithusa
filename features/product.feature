@javascript
Feature: Product
	Background:
		Given the following user:
			| name                  | dan             |
			| email                 | dan@example.com |
			| password              | pass            |
      | password_confirmation | pass            |
      | admin                 | true            |
		And that user is logged in.

  Scenario: Create New Product
    Given I am on the products page.
    When I follow "New Product"
    And I fill in the following:
      | product_name        | hat                          |
      | product_description | A thing to wear on your head |
      | product_price       | 5.95                         |
      | product_sizes       | xs,s,m,l,xl                  |
      | product_colors      | red,green,blue               |
    And I press "Create Product"
    Then I should see "Product successfully created."
    And I should see "Products"
    And I should see "hat"

  Scenario: Edit Product
    Given the following product:
      | name        | hat                          |
      | description | A thing to wear on your head |
      | price       | 5.95                         |
    And I am on that product's page.
    When I follow "Edit"
    And I fill in the following:
      | product_description | A great fashion accessory |
    And I press "Update Product"
    Then I should see "Product successfully updated."
    And I should see "A great fashion accessory"

  Scenario: Destroy Product
    Given the following product:
      | name        | hat                          |
      | description | A thing to wear on your head |
      | price       | 5.95                         |
    And I am on that product's page.
    When I follow "Delete"
    Then I should see "Product successfully deleted."
