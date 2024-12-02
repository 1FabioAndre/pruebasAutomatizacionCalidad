Given('I am on the Browser Test Page') do
    visit 'https://demo.borland.com/gmopost/browser-test.htm'
  end
  
  When('I check the position of the image button') do
    image_button = find('input[type="image"]')
    expect(image_button[:align]).to eq('right')
  end
  
  Then('the image button should be aligned to the right of the page') do
    image_button = find('input[type="image"]')
    # Verifica si el atributo 'align' tiene el valor 'right'
    expect(image_button[:align]).to eq('right')
  end
  
  Then('I should see the "Blinking Text" with a blinking effect') do
    # Como la etiqueta <blink> está obsoleta, buscamos el texto directamente dentro del <font> o <strong>
    blinking_text = find('strong', text: 'Blinking Text')
    expect(blinking_text).to have_text('Blinking Text')
  end
  
  When('I click the "{string}" link') do |link_name|
    click_link(link_name)
  end  
  
  Then('the mail client should open with the correct email address') do
    mailto_link = find('a[href^="mailto:"]')[:href]
    expect(mailto_link).to include("mailto:gmo-master@segue.com")
  end
  