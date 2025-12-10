require "rails_helper"

RSpec.describe "Landing Page", type: :system do
  before { visit root_path }

  it "Navigate to the About Us page from the link" do
    click_link "Nosotros"

    expect(page).to have_current_path("/about", ignore_query: true)
    expect(page).to have_selector("h1", text: "Sobre Nosotros")
  end

  describe "UI elements" do
    it "shows the correct page title" do
      expect(page).to have_title("Erp Plus")
    end

    it "shows the main heading" do
      expect(page).to have_selector("h1", text: "Gestiona tu negocio con ERP+")
    end

    it "shows the brand name in the hero section" do
      expect(page).to have_selector("span", text: "ERP+")
    end

    it "shows the main navigation links" do
      expect(page).to have_selector("a", text: "Inicio")
      expect(page).to have_selector("a", text: "Productos")
      expect(page).to have_selector("a", text: "Nosotros")
      expect(page).to have_selector("a", text: "Contacto")
      expect(page).to have_selector("a", text: "Iniciar sesión")
    end
  end
end
