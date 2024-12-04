# Scenario: Verify homepage elements
Given('I am on the homepage to GreenMountain') do
  visit 'https://demo.borland.com/gmopost/'
end

# Step to check the homepage elements
When('I look at the homepage') do
  # Aquí puedes agregar una verificación si lo deseas
end

# Verificación de botones en la página de inicio
And('I should see the "Enter GMO OnLine" button on the homepage') do
  expect(page).to have_button('Enter GMO OnLine', wait: 10)
end

And('I should see the "About The GMO Site" button on the homepage') do
  expect(page).to have_button('About The GMO Site', wait: 10)
end

And('I should see the "Browser Test Page" button on the homepage') do
  expect(page).to have_button('Browser Test Page', wait: 10)
end

# Verificación de la imagen del logo
And('I should see the logo on the homepage') do
  expect(page).to have_selector('img[src="images/gmo-animate.gif"]', visible: true)
  expect(find('img[src="images/gmo-animate.gif"]')[:alt]).to eq('Logo')
end

# Verificación de enlaces
And('I should see a link to the "mailto:gmo-master@segue.com" email address on the homepage') do
  expect(page).to have_link('Please let us know how you like our site.', href: 'mailto:gmo-master@segue.com')
end

# Verificación de títulos
And('I should see the "GMO OnLine" title on the homepage') do
  expect(page).to have_selector('h1', text: 'GMO OnLine', wait: 10)
end

# Verificación de texto de bienvenida
And('I should see the "Welcome to Green Mountain Outpost\'s OnLine Catalog!" text on the homepage') do
  expect(page).to have_content("Welcome to Green Mountain Outpost's OnLine Catalog!", wait: 10)
end

# ---------------------------------------------------------------------------------------------------------
When('I click the "Enter GMO OnLine" button') do
  click_button('Enter GMO OnLine')
end

Then('I should be redirected to the "Online Catalog" page') do
  expect(page).to have_current_path('https://demo.borland.com/gmopost/online-catalog.htm', wait: 10)
end

Then('I should see an "Online Catalog" heading') do
  expect(page).to have_selector('h1', text: 'OnLine Catalog', wait: 10)
end

Then('I should see the product table with items listed') do
  # Verificar que la tabla de productos esté presente
  expect(page).to have_selector('table', visible: true)  
  # Verificar que la tabla tenga productos listados
  expect(page).to have_content('3 Person Dome Tent')
  expect(page).to have_content('External Frame Backpack')
  expect(page).to have_content('Glacier Sun Glasses')
  expect(page).to have_content('Padded Socks')
  expect(page).to have_content('Hiking Boots')
  expect(page).to have_content('Back Country Shorts')
  # Contar las filas de la tabla (excluyendo la cabecera)
    rows = all('table tr').size
    # Verificar que haya 6 filas de productos
    expect(rows).to eq(12)
end
# ----------------------------------------------------------------------------------------------------------
When('I click the "About The GMO Site" button') do
  click_button('About The GMO Site')
end


Then('I should be redirected to the "About This Site" page') do
  expect(current_url).to eq('https://demo.borland.com/gmopost/about.htm')
end

And('I should see the page title "About This Site"') do
  expect(page).to have_title('About This Site')
end

And('I should see the technologies table with items listed') do
  # Verificamos que la tabla con tecnologías se muestra correctamente
  expect(page).to have_selector('table', count: 2)  # Una tabla de tecnologías, otra de aviso
  expect(page).to have_content('This site incorporates')  # Verificamos que la tabla contiene este texto
  expect(page).to have_content('It could also incorporate')  # Y este otro texto
  # Verificamos que ambos listados de tecnologías tengan los elementos correctos
  tech_items_1 = ['HTML 3.2', 'HTML Browser Extensions', 'Animation', 'JavaScript', 'CGI', 'Java', 'ActiveX', 'Client-side processes', 'Server-side processes']
  tech_items_2 = ['Style sheets', 'Multimedia', 'VBscript', 'Plug-Ins', 'IIOP', 'Cookies', 'Secure transactions', 'Database access']
  tech_items_1.each do |item|
    expect(page).to have_content(item)
  end
  tech_items_2.each do |item|
    expect(page).to have_content(item)
  end
end
# ----------------------------------------------------------------------------------------------------------