Feature: Bill Information Form
  As a user
  I want to fill out the Bill Information form
  So I can complete the billing and shipping details

Background:
  Given I am on the Green Mountain Outpost homepage
  And I navigate to the product catalog 
  And I add a product to the cart
  And I proceed to checkout

@maximize
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

Scenario Outline: Fill out Bill To information with invalid data
  When I fill in the Bill To section with the following details:
    | Name         | <name>          |
    | Address      | 123 Main St     |
    | City         | ciudad          |
    | State        | estado          |
    | Zip          | <zip>           |
    | Phone        | <phone>         |
    | E-mail       | pepe@example.com|
    | Card Type    | <card_type>     |
    | Card Number  | <card_number>   |
    | Expiration   | <expiration>    |
    | Same As Bill | true            |
  And I click Place the Order button
  Then I should see an alert with the message "<error_message>"

  Examples:
    | name       | zip       | phone         | card_type        | card_number      | expiration | error_message                                                                     |
    | Pepe Perez | 12345     | 555-555-5555 | Visa            | 4111111111111111   | 01/20      | Please enter a valid date of the form 'MM/YY' in this field.                      |
    | Pepe Perez | 12345     | 555-555-5555 | American Express| 4111111111111111   | 12/24      | Please enter a valid card number of the form '1234-123456-12345' in this field.   |
    | Pepe Perez | 12345     | 555-555-5555 | MasterCard      | 55 22 789 5458     | 12/24      | Please enter a valid card number of the form '1234-1234-1234-1234' in this field. |
    | Pepe Perez | 12345     | 555-555-5555 | Visa            | 55 22 789 5458     | 12/24      | Please enter a valid card number of the form '1234-1234-1234-1234' in this field. |
    | Pepe Perez | 12345     | +59173799571 | Visa            | 55 22 789 5458     | 12/24      | Please enter a valid phone number in this field.                                  |
    | Pepe Perez | 123456789 | 555-555-5555 | Visa            | 55 22 789 5458     | 12/24      | Please enter a valid zip code in this field.                                      |
    |            | 123456789 | 555-555-5555 | Visa            | 55 22 789 5458     | 12/24      | This is a required field.                                                         |