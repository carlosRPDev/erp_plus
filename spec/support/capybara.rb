# frozen_string_literal: true

require "capybara/rspec"

Capybara.default_max_wait_time = ENV["CI"] ? 10 : 5
Capybara.server = :puma, { Silent: true }

RSpec.configure do |config|
  config.before(:each, type: :system) do
    if ENV["CI"]
      driven_by :selenium_chrome_headless_ci
    else
      driven_by :selenium_chrome do |options|
        options.add_argument("--window-size=1400,900")
        options.add_argument("--disable-gpu")
        options.add_argument("--disable-dev-shm-usage")
      end
    end
  end
end

# Version headless de Capybara para pruebas rápidas
# driven_by :selenium_chrome_headless
