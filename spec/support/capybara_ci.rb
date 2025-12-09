# frozen_string_literal: true

if ENV["CI"] == "true"
  Capybara.raise_server_errors = false

  module Capybara
    module ScreenshotOpener
      def open_file(path)
        # En CI: no hacer nada
      end
    end
  end

  Capybara.extend Capybara::ScreenshotOpener
end
