class CatalogPage
    include Capybara::DSL
  
    def visit_catalog
      visit('https://demo.borland.com/gmopost/online-catalog.htm')
    end
  
    def enter_quantities(quantities)
      quantities.each do |product, quantity|
        case product
        when '3 Person Dome Tent'
          fill_in 'QTY_TENTS', with: quantity
        when 'External Frame Backpack'
          fill_in 'QTY_BACKPACKS', with: quantity
        when 'Glacier Sun Glasses'
          fill_in 'QTY_GLASSES', with: quantity
        when 'Padded Socks'
          fill_in 'QTY_SOCKS', with: quantity
        when 'Hiking Boots'
          fill_in 'QTY_BOOTS', with: quantity
        when 'Back Country Shorts'
          fill_in 'QTY_SHORTS', with: quantity
        end
      end
    end
  
    def click_place_order
      find('input[name="bSubmit"][value="Place An Order"]').click
    end
end
  