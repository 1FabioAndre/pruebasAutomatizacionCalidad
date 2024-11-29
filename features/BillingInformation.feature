Feature: Bill Information Form
 As a user
 I want to fill out the Bill Information form
 So I can complete the billing and shipping details

Background:
  Given I am on the Green Mountain Outpost homepage
  And I navigate to the product catalog
  And I add a product to the cart
  And I proceed to checkout

Scenario: Fill out Bill To information correctly
   When I fill in the Bill To section with the following details:
       | Name         | Pepe Perez         |
       | Address      | 123 Main St        |
       | City         | ciudad             |
       | State        | estado             |
       | Zip          | 12345              |
       | Phone        | 555-555-5555       |
       | E-mail       | pepe@example.com   |
       | Card Type    | Visa               |
       | Card Number  | 4111111111111111   |
       | Expiration   | 12/24              |
       | Same As Bill | true               |
   And I click Place the Order button
   Then the order should be accepted

Scenario: Fill out Bill To information with expired card date
    When I fill in the Bill To section with the following details:
        | Name         | Pepe Perez         |
        | Address      | 123 Main St        |
        | City         | ciudad             |
        | State        | estado             |
        | Zip          | 12345              |
        | Phone        | 555-555-5555       |
        | E-mail       | pepe@example.com   |
        | Card Type    | Visa               |
        | Card Number  | 4111111111111111   |
        | Expiration   | 01/20              |
        | Same As Bill | true               |
    And I click Place the Order button
    Then I should see an alert with the message "Please enter a valid date of the form 'MM/YY' in this field."

Scenario: Fill out Bill To information with expired with a wrong card number for American Express
    When I fill in the Bill To section with the following details:
        | Name         | Pepe Perez         |
        | Address      | 123 Main St        |
        | City         | ciudad             |
        | State        | estado             |
        | Zip          | 12345              |
        | Phone        | 555-555-5555       |
        | E-mail       | pepe@example.com   |
        | Card Type    | American Express   |
        | Card Number  | 4111111111111111   |
        | Expiration   | 12/24              |
        | Same As Bill | true               |
    And I click Place the Order button
    Then I should see an alert with the message "Please enter a valid card number of the form '1234-123456-12345' in this field."