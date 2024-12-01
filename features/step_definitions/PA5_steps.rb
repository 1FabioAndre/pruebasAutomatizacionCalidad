Given('I am on the GMO homepage for PA5') do
  visit 'https://demo.borland.com/gmopost/'
end

Then('the page title should be {string}') do |title|
  expect(page).to have_title("Welcome to Green Mountain Outpost")
end

When('I click the {string} button') do |button_name|
  case button_name
  when "Enter GMO Online"
    find('input[name="bSubmit"]').click
  when "About The GMO Site"
    find('input[name="bAbout"]').click
  when "Browser Test Page"
    find('input[name="bBrowserTest"]').click
  else
    raise "Button #{button_name} not found"
  end
end

Then('I should be on the {string} page') do |page_name|
  expected_url = case page_name
                 when "OnLine Catalog" then "https://demo.borland.com/gmopost/online-catalog.htm"
                 when "About This Site" then "https://demo.borland.com/gmopost/about.htm"
                 when "Browser Test Page" then "https://demo.borland.com/gmopost/browser-test.htm"
                 else
                   raise "Unknown page name: #{page_name}"
                 end
  expect(page).to have_current_path(expected_url, url: true)
end

And('I navigate back') do
  page.go_back
end

When('I click the {string} link') do |link_text|
  click_link(link_text)
end

Then('the mail client should open') do
  mailto_link = find('a[href^="mailto:"]')[:href]
  expect(mailto_link).to include("mailto:gmo-master@segue.com")
end
