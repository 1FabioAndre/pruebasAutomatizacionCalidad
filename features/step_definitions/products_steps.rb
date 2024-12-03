When('I click on the Hiking Boots link') do
    find(:xpath, '/html/body/form/table/tbody/tr[2]/td/div/center/table/tbody/tr[6]/td[2]/a/strong').click
  end
  
  Then('I should see the Hiking Boots details page') do
    expect(page).to have_content('Climb any mountain with our PermaDry all leather hiking boots.')
  end
  
  Then('I should see the price is {string}') do |price|
    expect(page).to have_content(price)
  end
  
  Then('I should see the item number is {string}') do |item_number|
    expect(page).to have_content("Item Number: #{item_number}")
  end
  
  Then('I should see the stock quantity is {string}') do |quantity|
    expect(page).to have_content("# In Stock: #{quantity}")
  end
  
  When('I click the browser back button') do
    page.go_back
  end
  
  Then('I should be back on the product catalog page') do
    expect(page).to have_content('These are the items currently available through our online catalog')
  end
  
  Then('I should see all available products') do
    expect(page).to have_content('3 Person Dome Tent')
    expect(page).to have_content('Hiking Boots')
    expect(page).to have_content('Back Country Shorts')
  end
  When('I click on the Padded Socks link') do
    find(:xpath, '/html/body/form/table/tbody/tr[2]/td/div/center/table/tbody/tr[5]/td[2]/a/strong').click
  end
  
  Then('I should see the Padded Socks details page') do
    expect(page).to have_content('Our favorite padded socks will make your next back country trek')
  end
  
  Then('I should see the product description containing {string}') do |text|
    expect(page).to have_content(text)
  end
  