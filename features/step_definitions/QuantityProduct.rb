require 'capybara/cucumber'

Given('I am on the GMO Home Page') do
  visit('https://demo.borland.com/gmopost/')
end

Given('I click on the "Enter GMO OnLine" button') do
  find(:xpath, '//input[@name="bSubmit" and @value="Enter GMO OnLine"]').click
end

When('I enter the order quantities as shown below:') do |table|
  table.hashes.each do |row|
    case row['Product Name']
    when '3 Person Dome Tent'
      find(:xpath, '//input[@name="QTY_TENTS"]').set(row['Quantity'])
    when 'External Frame Backpack'
      find(:xpath, '//input[@name="QTY_BACKPACKS"]').set(row['Quantity'])
    when 'Glacier Sun Glasses'
      find(:xpath, '//input[@name="QTY_GLASSES"]').set(row['Quantity'])
    when 'Padded Socks'
      find(:xpath, '//input[@name="QTY_SOCKS"]').set(row['Quantity'])
    end
  end
end

When('I click on the "Place An Order" button') do
  find(:xpath, '//input[@value="Place An Order"]').click
end

When('I press Enter while focused on the input') do
  field = find(:xpath, '//input[@name="QTY_TENTS"]')
  field.set('Hola')
  sleep(5)
  page.execute_script("arguments[0].dispatchEvent(new KeyboardEvent('keydown', {key: 'Enter'}));", field.native)
  #field.send_keys(:enter) # Presionar Enter mientras el campo tiene el foco
  sleep(5)
end

Then('I should see the following order summary:') do |table|
  table.hashes.each do |row|
    qty_xpath = "//table[@border='1']//tr[td/a/strong[contains(text(),'#{row['Product Description']}')]]/td[1]"
    unit_price_xpath = "//table[@border='1']//tr[td/a/strong[contains(text(),'#{row['Product Description']}')]]/td[4]"
    total_price_xpath = "//table[@border='1']//tr[td/a/strong[contains(text(),'#{row['Product Description']}')]]/td[5]"

    expect(find(:xpath, qty_xpath).text).to eq(row['Qty'])
    
    expect(find(:xpath, unit_price_xpath).text).to eq(row['Unit Price'])
    
    expect(find(:xpath, total_price_xpath).text).to eq(row['Total Price'])
  end
end

Then('I should see a warning alert with the message {string}') do |message|
  alert = page.driver.browser.switch_to.alert
  expect(alert.text).to eq(message)
  alert.accept
end
