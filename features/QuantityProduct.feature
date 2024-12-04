Feature: Add Order Quantity
  As an online shopper,
  I want to add product quantities to my order,
  so that I can complete my purchase.

  Background:
    Given I am on the GMO Home Page
    And I click on the "Enter GMO OnLine" button

  Scenario: Add Order quantities for products
    When I enter the order quantities as shown below:
      | Product Name              | Quantity |
      | 3 Person Dome Tent        | 8        |
      | External Frame Backpack   | 9        |
      | Glacier Sun Glasses       | 10       |
    And I click on the "Place An Order" button
    Then I should see the following order summary:
      | Qty  | Product Description       | Unit Price | Total Price |
      | 8    | 3 Person Dome Tent        | $ 299.99   | $ 2399.92   |
      | 9    | External Frame Backpack   | $ 179.95   | $ 1619.55   |
      | 10   | Glacier Sun Glasses       | $ 67.99    | $ 679.90    |

  Scenario: Click Place An Order without quantities
    When I click on the "Place An Order" button
    Then I should see a warning alert with the message "Please Order Something First"

  Scenario: Add invalid input (text) for quantities and press Enter
    When I enter the order quantities as shown below:
      | Product Name              | Quantity |
      | 3 Person Dome Tent        | Hola     |
    And I press Enter while focused on the input
    Then I should see a warning alert with the message "Please enter only digits in this field."
