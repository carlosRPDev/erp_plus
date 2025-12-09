# # frozen_string_literal: true

module SystemHelpers
  def login_as(user)
    visit "/login"
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "Ingresar"
  end

  def expect_flash(type:, message:)
    expect(page).to have_selector(
      "[data-erp-core--flash-target='message']",
      text: message,
      wait: 5
    )
  end
end

RSpec.configure do |config|
  config.include SystemHelpers, type: :system

  config.before(:each, type: :system) do
    driven_by :selenium_chrome_headless_ci
  end
end
