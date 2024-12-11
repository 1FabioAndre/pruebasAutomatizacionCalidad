Feature: Navigate GMO Online Catalog
  As an online GMO shopper
  I want to click the "Enter GMO OnLine" button
  So that I can access the product catalog

@maximize
Scenario: Enter GMO Online Catalog
  Given I am on the GMO Online homepage
  When I click on Enter GMO OnLine
  Then I should see the Online Catalog page
  And I should see the product list
  And I should see the "Place An Order" button
