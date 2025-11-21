# frozen_string_literal: true

# Version visuales de Capybara para pruebas con Selenium y Chrome
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      # IMPORTANTE: No usar headless
      opts.add_argument("--window-size=1400,1000")
    end
  )
end

Capybara.javascript_driver = :selenium_chrome

# Version headless de Capybara para pruebas rápidas
# require "capybara/rails"
# require "capybara/rspec"

# Capybara.register_driver :selenium_chrome_headless do |app|
#   options = Selenium::WebDriver::Chrome::Options.new
#   options.add_argument("--headless=new")
#   options.add_argument("--disable-gpu")
#   options.add_argument("--no-sandbox")
#   options.add_argument("--disable-dev-shm-usage")
#   options.add_argument("--window-size=1440,900")

#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :chrome,
#     options: options
#   )
# end

# Capybara.javascript_driver = :selenium_chrome_headless
# Capybara.default_driver = :selenium_chrome_headless