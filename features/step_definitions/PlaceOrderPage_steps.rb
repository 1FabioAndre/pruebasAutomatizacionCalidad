Given('I am on the GMO Home Page') do
    visit('https://demo.borland.com/gmopost/') # replace with the actual URL for the GMO Home Page
  end
  
  Given('I click on "Enter GMO OnLine" button') do
    # Localizamos y hacemos clic en el botón usando XPath
    find(:xpath, '//input[@name="bSubmit" and @value="Enter GMO OnLine"]').click
  end
  
  Given('I am at the "OnLine Catalog" Page') do
    visit('https://demo.borland.com/gmopost/online-catalog.htm') # replace with actual URL for the catalog page
  end
  
  When("I enter the order quantities as shown below:") do |table|
    table.hashes.each do |row|
      case row['Product Name']
      when '3 Person Dome Tent'
        fill_in 'QTY_TENTS', with: row['Quantity']
      when 'External Frame Backpack'
        fill_in 'QTY_BACKPACKS', with: row['Quantity']
      when 'Glacier Sun Glasses'
        fill_in 'QTY_GLASSES', with: row['Quantity']
      when 'Padded Socks'
        fill_in 'QTY_SOCKS', with: row['Quantity']
      when 'Hiking Boots'
        fill_in 'QTY_BOOTS', with: row['Quantity']
      when 'Back Country Shorts'
        fill_in 'QTY_SHORTS', with: row['Quantity']
      end
    end
  end

When('I click on the {string} button') do |button_name|
    find('input[name="bSubmit"][value="Place An Order"]').click
    expect(page).to have_current_path('https://demo.borland.com/gmopost/cgi-bin/perl.exe?place-order.pl', wait: 5)
end


Then('I should see the following order summary table:') do |table|
    table.hashes.each do |row|
      product_name = row['Product Name']
      product_price = row['Product Price']
      product_total = row['Product Total']
      sales_tax = row['Sales Tax']
      shipping_handling = row['Shipping & Handling']
      grand_total = row['Grand Total']
  
      # Verifica que los valores estén presentes en la página, usando expresiones regulares
      expect(page).to have_text(product_name)
      expect(page).to have_text(product_price)
      expect(page).to have_text(product_total)
      expect(page).to have_text(sales_tax)
      expect(page).to have_text(shipping_handling)
      expect(page).to have_text(grand_total)
  
      # Puedes usar expresiones regulares para permitir más flexibilidad
      expect(page).to have_text(/#{Regexp.escape(sales_tax.strip())}/)
      expect(page).to have_text(/#{Regexp.escape(shipping_handling.strip())}/)
      expect(page).to have_text(/#{Regexp.escape(grand_total.strip())}/)
    end
  end
  