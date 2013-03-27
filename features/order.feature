Feature: Placing Orders
  Background:
    Given the following product:
      | name  | hat  |
      | price | 5.95 |
    And I am on that product's page

  Scenario: User adds an item to the cart
    When I fill in the following:
      | Quantity | 1 |
    And I press "Add To Cart"
    Then I should see "Added to cart."

  Scenario: User views cart
    When I fill in the following:
      | Quantity | 1 |
    And I press "Add To Cart"
    And I follow "Cart"
    Then I should see "Cart"
    And I should see "hat"
    And I should see "Order Subtotal: $5.95"
    And I should see "Shipping: $5.95"
    And I should see "Total: $11.90" 

  Scenario: User removes an item from the cart
    When I fill in the following:
      | Quantity | 1 |
    And I press "Add To Cart"
    And I follow "Cart"
    And I press "Remove"
    Then I should see "Item removed!"
    And I should not see "hat"

  Scenario: User empties the cart
    When I fill in the following:
      | Quantity | 1 |
    And I press "Add To Cart"
    And I follow "Cart"
    And I press "Empty Cart"
    Then I should see "Cart emptied!"
    And I should not see "hat"

  Scenario: User proceeds to checkout
    When I fill in the following:
      | Quantity | 1 |
    And I press "Add To Cart"
    And I follow "Cart"
    And I follow "Proceed to Check Out"
    Then I should see "Place Order"
    And I should see "Shipping: $5.95"
    And I should see "Total: $11.90" 
