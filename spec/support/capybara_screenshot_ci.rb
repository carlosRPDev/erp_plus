# frozen_string_literal: true

return unless ENV["CI"]

module Capybara
  module ScreenshotOpener
    def open_file(path)
      # no-op
    end
  end
end

Capybara.extend Capybara::ScreenshotOpener
