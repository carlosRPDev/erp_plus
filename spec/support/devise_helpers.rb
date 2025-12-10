# frozen_string_literal: true

module DeviseRequestSpecHelpers
  def sign_in(user)
    post erp_core.user_session_path, params: {
      user: { email: user.email, password: user.password }
    }
  end

  def sign_out
    delete erp_core.destroy_user_session_path
  end
end

RSpec.configure do |config|
  config.include DeviseRequestSpecHelpers, type: :request
end
