Feature: Cart
  Background:
    Given the following product:
      | name        | hat                          |
      | description | A thing to wear on your head |
      | price       | 5.95                         |
      | sizes       | xs,s,m,l,xl                  |

  Scenario: Add product to cart
    Given I am on that product's page.
    When I fill in the following:
      | quantity | 2 |
    And I press "Add To Cart"
    And I follow "Cart"
    Then I should see "Order Subtotal: $11.90"
    And I should see "Shipping: $5.95"
    And I should see "Total: $17.85"

  Scenario: Remove item from cart
    Given I am on that product's page.
    When I fill in the following:
      | quantity | 2 |
    And I press "Add To Cart"
    And I follow "Cart"
    And I press "Remove"
    Then I should see "Item removed!"
    And I should see "Order Subtotal: $0.00"
    And I should see "Shipping: $0.00"
    And I should see "Total: $0.00"
