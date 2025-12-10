require "rails_helper"

RSpec.describe "User Login", type: :system do
  let(:user) { create(:erp_core_user, :confirmed) }

  it "allows the client to log in successfully." do
    login_as(user)

    expect(page).to have_text("Ingresó a Erp+ Clientes con éxito.")
    expect(page).to have_current_path("/clients/home", ignore_query: true)
  end
end
