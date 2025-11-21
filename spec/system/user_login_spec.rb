require "rails_helper"

RSpec.describe "User Login", type: :system do
  let(:user) { create(:erp_core_user, :confirmed) }

  it "permite iniciar sesión correctamente" do
    visit "/login"

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password

    click_button "Ingresar"

    # Validación basada en tu flash
    expect(page).to have_content("Ingresó a Erp+ Clientes con éxito.")

    # Validar que está en dashboard o ruta protegida
    expect(page).to have_current_path("/dashboard") # ajusta según engine
  end
end
