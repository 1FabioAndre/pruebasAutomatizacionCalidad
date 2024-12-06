Feature: Green Mountain Outpost Navigation
  As a user
  I want to navigate through the Green Mountain Outpost website
  So I can test its functionality

Background:
  Given I am on the homepage to GreenMountain

Scenario: Verify homepage elements
  When I look at the homepage
  And I should see the "Enter GMO OnLine" button on the homepage
  And I should see the "About The GMO Site" button on the homepage
  And I should see the "Browser Test Page" button on the homepage
  And I should see the logo on the homepage
  And I should see a link to the "mailto:gmo-master@segue.com" email address on the homepage
  And I should see the "GMO OnLine" title on the homepage
  And I should see the "Welcome to Green Mountain Outpost's OnLine Catalog!" text on the homepage

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
    And I should be redirected to the "Browser Test Page" page
    And I should see the page header "All Browsers Are Not Created Equal"
    And I should see a table with "Internet Explorer 3.0" and "Netscape Navigator 3.0" as headings

Scenario: Clicking the email link opens the email client
  When I should see a link to the "mailto:gmo-master@segue.com" email address on the homepage
  Then the link should open the email client with "mailto:gmo-master@segue.com"