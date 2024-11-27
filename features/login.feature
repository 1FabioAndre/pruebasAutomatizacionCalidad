Feature: Login functionality
  As a user
  I want to log into the application
  So that I can access my account

  Scenario: Login with valid credentials
    Given I am on the login page
    When I enter valid credentials
    And I click on the login button
    Then I should see the homepage
