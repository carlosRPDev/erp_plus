# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'
require "simplecov-json"

SimpleCov.start 'rails' do
  enable_coverage :branch
  add_filter '/spec/'
  add_group 'Engines', 'engines'
  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'

  minimum_coverage 90
  minimum_coverage_by_file 50
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::JSONFormatter
])
