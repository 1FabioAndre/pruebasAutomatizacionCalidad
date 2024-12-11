Feature: Green Mountain Outpost Navigation
  As an online GMO shopper
  I want to navigate through the Green Mountain Outpost website
  So I can test its functionality

Background:
  Given I am on the homepage to GreenMountain

Scenario: Verify homepage elements
  Then I should see all the homepage elements with correct properties

Scenario: Clicking the "Enter GMO OnLine" button redirects to the correct page
  When I click the "Enter GMO OnLine" button
  Then I should be redirected to the "Online Catalog" page
  And I should see an "Online Catalog" heading
  And I should see the product table with items listed

Scenario: Clicking the "About the GMO Site" button redirects to the correct page
  When I click the "About The GMO Site" button
  Then I should be redirected to the "About This Site" page
  And I should see the page title "About This Site"
  And I should see the technologies table with items listed

Scenario: Clicking the "Browser Test Page" button redirects to the correct page
  When I click the "Browser Test Page" button
  Then I should be redirected to the "Browser Test Page" page
  And I should see the page title "All Browsers Are Not Created Equal"
  And I should see a table with "Internet Explorer 3.0" and "Netscape Navigator 3.0" as table column titles

Scenario: Clicking the email link opens the email client
  When I click the email link
  Then the link should open the email client with "mailto:gmo-master@segue.com"
