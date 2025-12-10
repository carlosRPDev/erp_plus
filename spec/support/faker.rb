# frozen_string_literal: true

require "faker"

Faker::Config.locale = 'es'

RSpec.configure do |config|
  config.before do
    Faker::Config.random = Random.new(42)
  end
end
