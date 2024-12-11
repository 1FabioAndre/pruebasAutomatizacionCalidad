class QuantityProductPage
    include Capybara::DSL
    include RSpec::Matchers
  
    # Selectors for product quantity inputs
    PRODUCT_QUANTITY_FIELDS = {
      '3 Person Dome Tent' => 'QTY_TENTS',
      'External Frame Backpack' => 'QTY_BACKPACKS',
      'Glacier Sun Glasses' => 'QTY_GLASSES',
      'Padded Socks' => 'QTY_SOCKS',
      'Hiking Boots' => 'QTY_BOOTS',
      'Back Country Shorts' => 'QTY_SHORTS'
    }.freeze
  
    PLACE_ORDER_BUTTON = '//input[@value="Place An Order"]'
  
    # Actions
  
    def visit_quantity_page
      visit 'https://demo.borland.com/gmopost/'
    end
  
    def enter_quantities(quantities)
      quantities.each do |product_name, quantity|
        field_name = PRODUCT_QUANTITY_FIELDS[product_name]
        raise "Unknown product: #{product_name}" unless field_name
  
        fill_in field_name, with: quantity
      end
    end
  
    def click_place_order
      find(:xpath, PLACE_ORDER_BUTTON).click
    end
  
    def validate_order_summary(expected_summary)
      expected_summary.hashes.each do |row|
        qty_xpath = "//table[@border='1']//tr[td/a/strong[contains(text(),'#{row['Product Description']}')]]/td[1]"
        unit_price_xpath = "//table[@border='1']//tr[td/a/strong[contains(text(),'#{row['Product Description']}')]]/td[4]"
        total_price_xpath = "//table[@border='1']//tr[td/a/strong[contains(text(),'#{row['Product Description']}')]]/td[5]"
  
        expect(find(:xpath, qty_xpath).text).to eq(row['Qty'])
        expect(find(:xpath, unit_price_xpath).text).to eq(row['Unit Price'])
        expect(find(:xpath, total_price_xpath).text).to eq(row['Total Price'])
      end
    end
  
    def validate_warning_alert(expected_message)
      alert = page.driver.browser.switch_to.alert
      actual_message = alert.text
      alert.accept
      raise "Expected alert message: '#{expected_message}', but got: '#{actual_message}'" unless actual_message == expected_message
    end
  
    def enter_invalid_quantity(product_name, invalid_value)
      field_name = PRODUCT_QUANTITY_FIELDS[product_name]
      raise "Unknown product: #{product_name}" unless field_name
  
      fill_in field_name, with: invalid_value
    end
  
    def trigger_enter_key_on_field(product_name)
      field_name = PRODUCT_QUANTITY_FIELDS[product_name]
      raise "Unknown product: #{product_name}" unless field_name
  
      field = find(:xpath, "//input[@name='#{field_name}']")
      page.execute_script("arguments[0].dispatchEvent(new KeyboardEvent('keydown', {key: 'Enter'}));", field.native)
    end
  end