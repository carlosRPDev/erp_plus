# frozen_string_literal: true

class Home::About::Team::BaseComponent < ViewComponent::Base
  def initialize
    @grid_cols = team_grid_classes(team_members)
  end

  private

  def team_members
    [
      {
        name: 'Carlos Rodríguez',
        role: 'CoFundador & CTO',
        image: '/carlosCTO.jpeg'
      },
      {
        name: 'Luis Herrera',
        role: 'CoFundador & CEO',
        image: '/betoCEO.jpeg'
      }
    ]
  end

  def team_grid_classes(team)
    case team.size
    when 1
      'justify-center'
    when 2
      'grid-cols-1 sm:grid-cols-2'
    when 3
      'grid-cols-1 sm:grid-cols-3'
    else
      'grid-cols-1 sm:grid-cols-2 md:grid-cols-4'
    end
  end
end
