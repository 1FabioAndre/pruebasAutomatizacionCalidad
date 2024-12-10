class HomePage
    include Capybara::DSL
  
    def visit_page
      visit 'https://demo.borland.com/gmopost/'
    end
  
    def buttons
      {
        enter: find_button('Enter GMO OnLine'),
        about: find_button('About The GMO Site'),
        browser: find_button('Browser Test Page')
      }
    end
  
    def logo
      find('img[src="images/gmo-animate.gif"]')
    end
  
    def email_link
      find_link('Please let us know how you like our site.', href: 'mailto:gmo-master@segue.com')
    end
  
    def texts
      {
        title: find('h1', text: 'GMO OnLine'),
        welcome: find('p', text: "Welcome to Green Mountain Outpost's OnLine Catalog!")
      }
    end
  
    def click_button(button_text)
      find_button(button_text).click
    end

    def email_link
        find('a[href^="mailto:"]')
    end

    def click_enter_gmo_online
        find(:xpath, '//input[@name="bSubmit" and @value="Enter GMO OnLine"]').click
    end
end
  