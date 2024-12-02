Feature: Product Detail Navigation
  As a user
  I want to view detailed product information
  So I can learn more about specific items before purchase

Background:
  Given I am on the Green Mountain Outpost homepage
  And I navigate to the product catalog

Scenario: View Hiking Boots Details
  When I click on the Hiking Boots link
  Then I should see the Hiking Boots details page
  And I should see the price is "$ 109.90"
  And I should see the item number is "1004"
  And I should see the stock quantity is "32"

Scenario: Navigate back to catalog from Hiking Boots details
  When I click on the Hiking Boots link
  And I click the browser back button
  Then I should be back on the product catalog page
  And I should see all available products