RSpec.configure do |config|
  config.after(:each, type: :system) do |example|
    next if example.exception.blank?

    if ENV['CI'].present?
      save_screenshot("tmp/capybara/#{example.full_description.parameterize}.png")
      puts "\n[CI] Screenshot saved for failed example: #{example.full_description}"
    else
      save_and_open_screenshot
    end
  end
end
