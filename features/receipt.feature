Feature: Receipt Verification
  As an online GMO shopper
  I want to verify my order receipt
  So I can confirm my purchase details and total amount

Background:
  Given I am on the Green Mountain Outpost homepage
  And I navigate to the product catalog
  And I add a product to the cart
  And I proceed to checkout
@maximize
Scenario: Verify receipt details after successful order placement
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
  And I should see the following billing information:
    | Name        | Pepe Perez     |
    | Address     | 123 Main St    |
    | City        | ciudad         |
    | State       | estado         |
    | Zip         | 12345          |
    | Phone       | 555-555-5555   |