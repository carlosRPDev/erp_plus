# frozen_string_literal: true

module SlowMotion
  def slow_motion_sleep
    return if ENV["CI"]
    sleep(ENV.fetch("SLOW_MO", 0).to_f)
  end

  def visit(*args, **kwargs)
    super
    slow_motion_sleep
  end

  def fill_in(locator = nil, with: nil, **kwargs)
    super
    slow_motion_sleep
  end

  def click_button(locator = nil, **kwargs)
    super
    slow_motion_sleep
  end

  def click_link(locator = nil, **kwargs)
    super
    slow_motion_sleep
  end
end

Capybara::Session.prepend(SlowMotion)
