# frozen_string_literal: true

class Features::BaseComponent < ViewComponent::Base
  def initialize(features: [])
    @features = features
  end
end
