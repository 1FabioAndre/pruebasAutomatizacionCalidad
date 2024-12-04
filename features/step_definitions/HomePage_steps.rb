Given('I am on the homepage to GreenMountain') do
  visit 'https://demo.borland.com/gmopost/'
end

When('I look at the homepage') do
end

And('I should see the "Enter GMO OnLine" button on the homepage') do
  expect(page).to have_button('Enter GMO OnLine', wait: 10)
end

And('I should see the "About The GMO Site" button on the homepage') do
  expect(page).to have_button('About The GMO Site', wait: 10)
end

And('I should see the "Browser Test Page" button on the homepage') do
  expect(page).to have_button('Browser Test Page', wait: 10)
end

And('I should see the logo on the homepage') do
  expect(page).to have_selector('img[src="images/gmo-animate.gif"]', visible: true)
  expect(find('img[src="images/gmo-animate.gif"]')[:alt]).to eq('Logo')
end

And('I should see a link to the "mailto:gmo-master@segue.com" email address on the homepage') do
  expect(page).to have_link('Please let us know how you like our site.', href: 'mailto:gmo-master@segue.com')
end

And('I should see the "GMO OnLine" title on the homepage') do
  expect(page).to have_selector('h1', text: 'GMO OnLine', wait: 10)
end

And('I should see the "Welcome to Green Mountain Outpost\'s OnLine Catalog!" text on the homepage') do
  expect(page).to have_content("Welcome to Green Mountain Outpost's OnLine Catalog!", wait: 10)
end
