# spec/support/faker.rb
require "faker"

# Configuración opcional: idioma por defecto
Faker::Config.locale = 'es'

RSpec.configure do |config|
  config.before(:each) do
    # Asegura que Faker sea determinista si lo deseas
    Faker::Config.random = Random.new(42)
  end
end
