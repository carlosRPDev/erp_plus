# frozen_string_literal: true

class Pricing::BaseComponent < ViewComponent::Base
  def initialize(plans: [])
    @plans = plans
  end
end
