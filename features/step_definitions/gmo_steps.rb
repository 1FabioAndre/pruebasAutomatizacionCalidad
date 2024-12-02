Given('I am on the GMO Online homepage') do
  visit 'https://demo.borland.com/gmopost/'
end

When('I click on Enter GMO OnLine') do
  find('body > form > div:nth-child(1) > center > table > tbody > tr > td:nth-child(1) > input[type=button]').click
end

Then('I should see the Online Catalog page') do
  expect(page).to have_content('OnLine Catalog')
end

Then('I should see the product list') do
  expect(page).to have_content('3 Person Dome Tent')
  expect(page).to have_content('External Frame Backpack')
  expect(page).to have_content('Glacier Sun Glasses')
end

Then('I should see the {string} button') do |button_text|
  expect(page).to have_button(button_text)
end