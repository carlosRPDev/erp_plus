# frozen_string_literal: true

if ENV["CI"]
  module Capybara
    class << self
      def save_and_open_page(_path)
        # no-op en CI
      end

      def save_and_open_screenshot(_path)
        # no-op en CI
      end
    end
  end

  Capybara.register_driver :selenium_chrome_headless_ci do |app|
    options = ::Selenium::WebDriver::Chrome::Options.new
    options.add_argument("--headless=new")
    options.add_argument("--disable-gpu")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--window-size=1400,1400")

    Capybara::Selenium::Driver.new(app, browser: :chrome, options:)
  end
  Capybara.javascript_driver = :selenium_chrome_headless_ci
  Capybara.default_driver    = :selenium_chrome_headless_ci
end
