# spec/support/factory_bot.rb

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    # Hace que Faker use siempre los mismos datos entre ejecuciones (si se quiere reproducibilidad)
    Faker::Config.random = Random.new(42)
  end
end
