Feature: Validate navigation buttons on the homepage
  As a user
  I want to verify the navigation buttons on the homepage
  So I can navigate through the website properly

  Background:
    Given I am on the GMO homepage for PA5

  Scenario: Verify navigation buttons functionality
    Then the page title should be "Welcome to Green Mountain Outpost"
    When I click the "Enter GMO Online" button
    Then I should be on the "OnLine Catalog" page
    And I navigate back
    When I click the "About The GMO Site" button
    Then I should be on the "About This Site" page
    And I navigate back
    When I click the "Browser Test Page" button
    Then I should be on the "Browser Test Page" page
    And I navigate back
    When I click the "Please let us know how you like our site" link
    Then the mail client should open
