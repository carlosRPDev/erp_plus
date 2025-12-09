# frozen_string_literal: true

if ENV["CI"] == "true"
  require "selenium/webdriver"

  Capybara.register_driver :chrome_headless_ci do |app|
    options = Selenium::WebDriver::Chrome::Options.new

    options.add_argument("--headless=new")
    options.add_argument("--disable-gpu")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--window-size=1920,1080")

    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  Capybara.javascript_driver = :chrome_headless_ci

  RSpec.configure do |config|
    config.before(:each, type: :system) do
      driven_by :chrome_headless_ci
    end
  end
end
