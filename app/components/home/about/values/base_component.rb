# frozen_string_literal: true

class Home::About::Values::BaseComponent < ViewComponent::Base
  def initialize(alternate: true)
    @alternate = alternate
  end

  private

  def values
    [
      {
        title: "Innovación",
        desc: "Buscamos mejorar constantemente nuestras soluciones para los negocios emergentes.",
        image: "https://redeselectricas.com/wp-content/uploads/2024/09/3M-Inteligencia-artificial-redes-electricas-scaled.jpg"
      },
      {
        title: "Compromiso",
        desc: "Acompañamos a nuestros clientes en cada paso de su crecimiento.",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScnM4PkZIEFAh4e3P3qRngwVCyTIcF2cLEGw&s"
      },
      {
        title: "Transparencia",
        desc: "Creemos en relaciones honestas y herramientas claras.",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQliSkHFpPwt3L8dQ7fhdTzXKIqkRX9aUhee0um_tPmHnBIpZ3lNbhDwzksHZi-J2B77a4&usqp=CAU"
      }
    ]
  end
end
