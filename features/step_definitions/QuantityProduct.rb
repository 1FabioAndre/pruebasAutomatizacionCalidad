require 'capybara/cucumber'

Given('I am on the GMO Home Page') do
  @quantity_page = QuantityProductPage.new
  @quantity_page.visit_quantity_page
end

Given('I click on the "Enter GMO OnLine" button') do
  @home_page = HomePage.new
  @home_page.click_enter_gmo_online
end

When('I enter the order quantities as shown below:') do |table|
  quantities = table.hashes.map { |row| [row['Product Name'], row['Quantity']] }.to_h
  @quantity_page.enter_quantities(quantities)
end

When('I click on the "Place An Order" button') do
  @quantity_page.click_place_order
end

When('I press Enter while focused on the input') do
  @quantity_page.trigger_enter_key_on_field('3 Person Dome Tent')
end

Then('I should see the following order summary:') do |table|
  @quantity_page.validate_order_summary(table)
end

Then('I should see a warning alert with the message {string}') do |message|
  @quantity_page.validate_warning_alert(message)
end
