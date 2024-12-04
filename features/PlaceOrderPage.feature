Feature: Verify Grand Total Calculation
    As an online shopper,
    I want the system to correctly calculate the Grand Total
    so that I can review the total price of my order before placing it.

Background:
    Given I am on the GMO Home Page
    And I click on "Enter GMO OnLine" button

Scenario Outline: Verify Grand Total Calculation for Various Products
    Given I am at the "OnLine Catalog" Page
    When I enter the order quantities as shown below 1:
    | Product Name                | Quantity   |
    | <product_name>              | <quantity> |
    And I click on the "Place An Order" button 1
    Then I should see the following order summary table:
    | Product Name                | Product Price  | Product Total  | Sales Tax   | Shipping & Handling | Grand Total   |
    | <product_name>              | <product_price>| <product_total>| <sales_tax> | <shipping_handling> | <grand_total> |
      
Examples:
    | product_name            | quantity | product_price | product_total | sales_tax | shipping_handling | grand_total |
    | 3 Person Dome Tent      | 10       | $ 299.99      | $ 2999.90     | $ 150.00  | $ 5.00            | $ 3154.90   |
    | External Frame Backpack | 5        | $ 179.95      | $ 899.75      | $ 44.99   | $ 5.00            | $ 949.74    |
    | Glacier Sun Glasses     | 3        | $ 67.99       | $ 203.97      | $ 10.20   | $ 5.00            | $ 219.17    |
    | Padded Socks            | 7        | $ 19.99       | $ 139.93      | $ 7.00    | $ 5.00            | $ 151.93    |
    | Hiking Boots            | 9        | $ 109.90      | $ 989.10      | $ 49.46   | $ 5.00            | $ 1043.56   |
    | Back Country Shorts     | 2        | $ 24.95       | $ 49.90       | $ 2.50    | $ 5.00            | $ 57.39     |