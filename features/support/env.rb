require 'capybara/cucumber'
require 'selenium-webdriver'

# Configura Capybara para usar Chrome como navegador
Capybara.default_driver = :selenium_chrome
Capybara.app_host = "https://demo.borland.com/gmopost/"
Capybara.default_max_wait_time = 5
