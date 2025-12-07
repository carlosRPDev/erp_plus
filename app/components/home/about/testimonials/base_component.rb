# frozen_string_literal: true

class Home::About::Testimonials::BaseComponent < ViewComponent::Base
  private

  def testimonials
    [
      {
        name: 'Papelería Mundo Escolar',
        quote: 'Desde que usamos ERP+, nuestro control de inventario es perfecto y hemos reducido pérdidas.',
        image: 'https://www.dzoom.org.es/wp-content/uploads/2020/02/portada-foto-perfil-redes-sociales-consejos.jpg'
      },
      {
        name: 'OfiPlus Tienda',
        quote: 'Las métricas de ventas nos ayudaron a tomar mejores decisiones y aumentar las ganancias.',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2oZZ4gws3t7XYMz2lhTf5njIKdGScPQaPxg&s'
      },
      {
        name: 'Distribuidora Escolar',
        quote: 'ERP+ nos permitió crecer sin perder el control del negocio.',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTefdAYZ6uy2rn4ODl9zSL1KwCAhiEPo9Xm-g&s'
      }
    ]
  end
end
