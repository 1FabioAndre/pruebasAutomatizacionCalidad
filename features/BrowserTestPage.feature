Feature: Verify image button placement
  As a user
  I want to verify the image button is placed correctly on the page
  So I can ensure proper alignment

  Background:
    Given I am on the Browser Test Page

  Scenario: Check image button position
    When I check the position of the image button
    Then the image button should be aligned to the right of the page

  Scenario: Check for blinking text
    Then I should see the "Blinking Text" with a blinking effect

  Scenario: Check mailto link
    When I click the "Please let us know how you like our site" link
    Then the mail client should open with the correct email address
