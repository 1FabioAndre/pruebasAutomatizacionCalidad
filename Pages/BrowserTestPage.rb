class BrowserTestPage
    include Capybara::DSL
  
    # Locators
    def gmo_image_button
      find('input[type="button"][name="B2"]')  # Aquí seleccionamos el botón correcto
    end
  
    def blinking_text
        text_element = find('blink')
    end
  
    def mailto_link
      find('a[href^="mailto:"]')
    end
  
    # Actions
    def visit_page
      visit 'https://demo.borland.com/gmopost/browser-test.htm'
    end
  
    def click_left_or_right_button
      gmo_image_button.click  # Hace clic en el botón que activa la alerta
    end
  
    def alert_message
        wait = Selenium::WebDriver::Wait.new(timeout: 10) # Establecer espera de hasta 10 segundos
        alert = wait.until { page.driver.browser.switch_to.alert } # Espera a que aparezca la alerta
        alert.text
    end
  
    def close_alert
      page.driver.browser.switch_to.alert.accept
    end
  end
  