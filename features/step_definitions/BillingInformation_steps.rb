Given('I am on the Green Mountain Outpost homepage') do
    visit 'https://demo.borland.com/gmopost/'
  end
  
  Given('I navigate to the product catalog') do
    find('body > form > div:nth-child(1) > center > table > tbody > tr > td:nth-child(1) > input[type=button]').click
  end
  
  Given('I add 1 tent to the cart') do
    fill_in 'QTY_TENTS', with: 1
    find('body > form > table > tbody > tr:nth-child(3) > td > div > center > table > tbody > tr > td > p > input[type=submit]:nth-child(2)').click
  end
  
  Given('I proceed to checkout') do
    find('body > form > table > tbody > tr:nth-child(3) > td > p > input[type=submit]').click
  end
  
  When('I fill in the Bill To section with the following details:') do |table|
    @billing_page = BillingPage.new
    @billing_page.fill_billing_details(table.rows_hash)
  end
  
  When('I click Place the Order button') do
    @billing_page.click_place_order
  end
  
  Then('the order should be accepted') do
    expect(@billing_page.get_confirmation_text).to eq('Thank you for shopping with Green Mountain Outpost')
  end
  
  Then('I should see an alert with the message {string}') do |expected_message|
    actual_message = @billing_page.get_alert_text
    expect(actual_message).to eq(expected_message)
  end