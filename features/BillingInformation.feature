@bvt
Feature: Bill Information Form
  As a user completing a purchase
  I want to fill out the Bill Information form accurately
  So I can complete my order with valid billing and shipping details

Background:
  Given I am on the Green Mountain Outpost homepage
  And I navigate to the product catalog 
  And I add 1 tent to the cart
  And I proceed to checkout

@critical @smoke @maximize
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

@validation @payment
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

  @validation-card-expiry
  Examples:
    | name       | zip       | phone        | card_type    | card_number      | expiration | error_message                                                                  |
    | Pepe Perez | 12345     | 555-555-5555 | Visa        | 4111111111111111 | 01/20      | Please enter a valid date of the form 'MM/YY' in this field.                  |

  @validation-card-format
  Examples:
    | name       | zip       | phone        | card_type       | card_number      | expiration | error_message                                                                  |
    | Pepe Perez | 12345     | 555-555-5555 | American Express| 4111111111111111 | 12/24      | Please enter a valid card number of the form '1234-123456-12345' in this field.|
    | Pepe Perez | 12345     | 555-555-5555 | MasterCard     | 55 22 789 5458   | 12/24      | Please enter a valid card number of the form '1234-1234-1234-1234' in this field.|
    | Pepe Perez | 12345     | 555-555-5555 | Visa           | 55 22 789 5458   | 12/24      | Please enter a valid card number of the form '1234-1234-1234-1234' in this field.|

  @validation-contact-info
  Examples:
    | name       | zip       | phone        | card_type    | card_number      | expiration | error_message                                                  |
    | Pepe Perez | 12345     | +59173799571 | Visa        | 55 22 789 5458   | 12/24      | Please enter a valid phone number in this field.               |
    | Pepe Perez | 123456789 | 555-555-5555 | Visa        | 55 22 789 5458   | 12/24      | Please enter a valid zip code in this field.                   |

  @validation-required-fields
  Examples:
    | name       | zip       | phone        | card_type    | card_number      | expiration | error_message              |
    |            | 123456789 | 555-555-5555 | Visa        | 55 22 789 5458   | 12/24      | This is a required field.  |