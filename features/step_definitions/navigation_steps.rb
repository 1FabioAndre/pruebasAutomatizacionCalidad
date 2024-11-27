Given("I open the homepage") do
    visit "/"
  end
  
  Then("the title should contain {string}") do |expected_title|
    expect(page.title).to include(expected_title)
  end
  
  Then("the header should display {string}") do |expected_header|
    expect(page).to have_selector("h1", text: expected_header)
  end
  
  Then("the buttons {string} and {string} should be present") do |button1, button2|
    expect(page).to have_button(button1)
    expect(page).to have_button(button2)
  end
  