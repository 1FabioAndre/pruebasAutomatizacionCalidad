Given('I click on "Enter GMO OnLine" button') do
  @home_page = HomePage.new 
  @home_page.click_enter_gmo_online
end

Given('I am at the "OnLine Catalog" Page') do
  @catalog_page = CatalogPage.new
  @catalog_page.visit_catalog
end

When('I enter the order quantities as shown below 1:') do |table|
  quantities = table.hashes.map { |row| [row['Product Name'], row['Quantity']] }.to_h
  @catalog_page.enter_quantities(quantities)
end

When('I click on the "Place An Order" button 1') do
  @catalog_page.click_place_order
end

Then('I should see the following order summary table:') do |table|
  @order_summary_page = OrderSummaryPage.new
  @order_summary_page.verify_order_summary(table)
end
