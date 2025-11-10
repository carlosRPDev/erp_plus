# frozen_string_literal: true

class Cta::BaseComponent < ViewComponent::Base
  def initialize(title: "Comienza ahora tu prueba gratuita", subtitle: "Accede a todas las funcionalidades por 14 días sin tarjeta de crédito", primary_url: "#", secondary_url: "#")
    @title = title
    @subtitle = subtitle
    @primary_url = primary_url
    @secondary_url = secondary_url
  end
end
