# frozen_string_literal: true

if ENV["CI"] == "true"
  require "capybara-screenshot/rspec"

  module Capybara
    module Screenshot
      class Saver
        def open_file(file_path)
          # No hace nada en CI
        end
      end
    end
  end

  Capybara::Screenshot.prune_strategy = :keep_last_run
end
