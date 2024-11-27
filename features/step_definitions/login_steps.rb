Given("I am on the login page") do
    visit "/"
  end
  
  When("I enter valid credentials") do
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
  end
  
  And("I click on the login button") do
    click_button "Login"
  end
  
  Then("I should see the homepage") do
    expect(page).to have_content("Welcome")
  end
  