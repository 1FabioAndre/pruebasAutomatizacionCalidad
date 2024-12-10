Feature: Verify behavior on Browser Test Page

  Background:
    Given I am on the Browser Test Page

  Scenario: Click the left or right button
    When I click the left or right button
    Then I should see an alert with the message on the Browser Test Page "This button AND the GMO image should be on the right edge of the page!"

  Scenario: Verify blinking text with correct content
    Then I should see the "Blinking Text"

  Scenario: Verify that the mail client opens with the correct email address
    Then the mail client should open with the correct email address "gmo-master@segue.com"

