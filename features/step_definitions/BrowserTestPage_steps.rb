Given('I am on the Browser Test Page') do
    @browser_page = BrowserTestPage.new
    @browser_page.visit_page
  end
  
  When('I click the left or right button') do
    @browser_page.click_left_or_right_button  # Ahora hace clic en el botón correcto
  end
  
  Then('I should see an alert with the message on the Browser Test Page {string}') do |expected_message|
    begin
      # Espera a que la alerta esté disponible
      alert_message = @browser_page.alert_message
      expect(alert_message).to eq(expected_message)
    rescue Selenium::WebDriver::Error::NoSuchAlertError
      raise "No alert was present"
    end
  end
  
  Then('I should see the "Blinking Text"') do
    # Buscar el elemento blink
    blinking_text = @browser_page.blinking_text
    
    # Verificar que el texto sea exactamente 'Blinking Text'
    expect(blinking_text.text).to eq('Blinking Text')
    
    # Verificar que el elemento blink esté presente y visible
    expect(blinking_text).to be_visible
  end
   
  Then('the mail client should open with the correct email address {string}') do |expected_email|
    # Obtener el enlace mailto
    mailto_link = @browser_page.mailto_link[:href]

    # Verificar que el enlace contenga el correo esperado
    expect(mailto_link).to include("mailto:#{expected_email}")
  
    # Mostrar un mensaje informativo
    puts "Mailto link found with email: #{expected_email}"
  end
  
  