Then('I should see the following billing information:') do |table|
    receipt_details = table.rows_hash
    field_selectors = {
      "Name" => [
        'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(1) > td:nth-child(2) > strong',
        'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(1) > td:nth-child(5) > strong'
      ],
      "Address" => [
        'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(2) > strong',
        'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(2) > td:nth-child(5) > strong'
      ],
      "City" => [
        'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(3) > td:nth-child(2) > strong',
        'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(3) > td:nth-child(5) > strong'
      ],
      "Phone" => [
        nil,
        'body > table:nth-child(5) > tbody > tr:nth-child(1) > td > div > center > table > tbody > tr:nth-child(4) > td:nth-child(5) > strong'
      ]
    }
      
    receipt_details.each do |field_name, field_value|
      billing_selector, shipping_selector = field_selectors[field_name]
      formatted_value = case field_name
                       when "City"
                         "#{receipt_details['City']}, #{receipt_details['State']} #{receipt_details['Zip']}"
                       else
                         field_value
                       end
        
      if billing_selector
        billing_element = find(billing_selector)
        expect(billing_element.text).to eq(formatted_value)
      end
      if shipping_selector
        shipping_element = find(shipping_selector)
        expect(shipping_element.text).to eq(formatted_value)
      end
    end
  end