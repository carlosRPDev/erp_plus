# # frozen_string_literal: true

require "capybara/rspec"
require "selenium/webdriver"

# Version headless de Capybara para pruebas rápidas
# RSpec.configure do |config|
#   config.before(:each, type: :system) do
#     driven_by :selenium_chrome_headless
#   end
# end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium_chrome
  end
end
