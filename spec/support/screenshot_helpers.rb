RSpec.configure do |config|
  config.after(:each, type: :system) do |example|
    if example.exception.present?
      next if ENV["CI"]
      save_and_open_screenshot
    end
  end
end
