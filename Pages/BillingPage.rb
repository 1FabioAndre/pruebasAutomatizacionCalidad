class BillingPage
  include Capybara::DSL

  def fill_billing_details(details)
    fill_in 'billName', with: details['Name']
    fill_in 'billAddress', with: details['Address']
    fill_in 'billCity', with: details['City']
    fill_in 'billState', with: details['State']
    fill_in 'billZipCode', with: details['Zip'] 
    fill_in 'billPhone', with: details['Phone']
    fill_in 'billEmail', with: details['E-mail']
    select details['Card Type'], from: 'CardType'
    fill_in 'CardNumber', with: details['Card Number']
    fill_in 'CardDate', with: details['Expiration']
    check 'shipSameAsBill' if details['Same As Bill'] == 'true'
  end

  def click_place_order
    find('body > form > table > tbody > tr:nth-child(3) > td:nth-child(3) > input[type=submit]').click
  end

  def get_confirmation_text
    find('body > h4 > font').text
  end

  def get_alert_text
    alert = page.driver.browser.switch_to.alert
    message = alert.text
    alert.accept
    message
  end
end