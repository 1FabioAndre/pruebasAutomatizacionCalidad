Feature:  Homepage navigation
          As a user
          I want to visit the homepage
          So that I can verify it loads correctly

@maximize
Scenario: Verify homepage loads correctly
          Given I open the homepage
          Then the title should contain "Welcome to Green Mountain Outpost"
          And the header should display "GMO OnLine"
          And the buttons "Enter GMO OnLine" and "About The GMO Site" should be present
