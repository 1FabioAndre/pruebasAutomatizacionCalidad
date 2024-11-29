Feature: Bill Information Form
  As a user
  I want to fill out the Bill Information form
  So I can complete the billing and shipping details

Scenario: Fill out Bill To information correctly
    Given I am on the GMO homepage
    And I enter to product catalog
    And I place an order
    And I proceed with order
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