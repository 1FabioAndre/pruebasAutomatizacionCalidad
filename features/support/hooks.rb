After do 
    Capybara.current_session.driver.quit
end
After do
    Capybara.reset_sessions!
    page.driver.browser.manage.delete_all_cookies
  end

Before '@maximize' do
    page.driver.browser.manage.window.maximize
end

