Feature:  Navigate GMO Online Catalog
          As a user, I want to click the "Enter GMO OnLine" button and verify the catalog page.

@maximize
Scenario: Enter GMO Online Catalog
          Given I am on the GMO Online homepage
          When I click the "Enter GMO OnLine" button
          Then I should see the Online Catalog page