# Background
Given('I am on the homepage to GreenMountain') do
  @home_page = HomePage.new
  @home_page.visit_page
end

# Scenario: Verify homepage elements
Then('I should see all the homepage elements with correct properties') do
  # Verificar botones
  buttons = @home_page.buttons
  expect(buttons[:enter]).to be_visible
  expect(buttons[:about]).to be_visible
  expect(buttons[:browser]).to be_visible

  # Verificar logo
  logo = @home_page.logo
  expect(logo[:alt]).to eq('Logo')

  # Verificar enlace de correo
  email_link = @home_page.email_link
  expect(email_link[:href]).to eq('mailto:gmo-master@segue.com')

  # Verificar textos
  texts = @home_page.texts
  expect(texts[:title].text).to eq('GMO OnLine')
  expect(texts[:welcome].text).to eq("Welcome to Green Mountain Outpost's OnLine Catalog!")
end

# Scenario: Clicking the "Enter GMO OnLine" button
When('I click the "Enter GMO OnLine" button') do
  @home_page.click_button('Enter GMO OnLine')
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

  # Verificar que la tabla contiene productos
  products = [
    '3 Person Dome Tent',
    'External Frame Backpack',
    'Glacier Sun Glasses',
    'Padded Socks',
    'Hiking Boots',
    'Back Country Shorts'
  ]
  products.each { |product| expect(page).to have_content(product) }

  # Verificar la cantidad de filas en la tabla
  rows = all('table tr').size
  expect(rows).to eq(12)
end

# Scenario: Clicking the "About the GMO Site" button
When('I click the "About The GMO Site" button') do
  @home_page.click_button('About The GMO Site')
end

Then('I should be redirected to the "About This Site" page') do
  expect(page).to have_current_path('https://demo.borland.com/gmopost/about.htm', wait: 10)
end

Then('I should see the page title "About This Site"') do
  expect(page).to have_title('About This Site')
end

Then('I should see the technologies table with items listed') do
  tech_items_1 = [
    'HTML 3.2',
    'HTML Browser Extensions',
    'Animation',
    'JavaScript',
    'CGI',
    'Java',
    'ActiveX',
    'Client-side processes',
    'Server-side processes'
  ]
  tech_items_2 = [
    'Style sheets',
    'Multimedia',
    'VBscript',
    'Plug-Ins',
    'IIOP',
    'Cookies',
    'Secure transactions',
    'Database access'
  ]

  # Verificar cada ítem de las listas
  tech_items_1.each { |item| expect(page).to have_content(item) }
  tech_items_2.each { |item| expect(page).to have_content(item) }
end

# Scenario: Clicking the "Browser Test Page" button
When('I click the "Browser Test Page" button') do
  @home_page.click_button('Browser Test Page')
end

Then('I should be redirected to the "Browser Test Page" page') do
  expect(page).to have_current_path('https://demo.borland.com/gmopost/browser-test.htm', wait: 10)
end

Then('I should see the page title "All Browsers Are Not Created Equal"') do
  expect(page).to have_selector('h1', text: 'All Browsers Are Not Created Equal')
end

Then('I should see a table with "Internet Explorer 3.0" and "Netscape Navigator 3.0" as table column titles') do
  within('td[valign="top"] table') do
    expect(page).to have_content('Internet Explorer 3.0')
    expect(page).to have_content('Netscape Navigator 3.0')
  end
end

# Scenario: Clicking the email link
When('I click the email link') do
  email_link = @home_page.email_link
  email_link.click
end

Then('the link should open the email client with {string}') do |mailto_link|
  email_link = @home_page.email_link
  expect(email_link[:href]).to eq(mailto_link)
end
