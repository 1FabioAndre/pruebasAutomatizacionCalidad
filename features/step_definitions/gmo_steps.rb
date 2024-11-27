Given('I am on the GMO Online homepage') do
  visit '/'
end

When('I click the "Enter GMO OnLine" button') do
  click_button 'Enter GMO OnLine'
end

Then('I should see the Online Catalog page') do
  expect(page).to have_content('OnLine Catalog')
end
