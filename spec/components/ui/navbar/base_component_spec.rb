# frozen_string_literal: true

require "rails_helper"

RSpec.describe Ui::Navbar::BaseComponent, type: :component do
  include ViewComponent::TestHelpers
  include Rails.application.routes.url_helpers
  include ErpCore::Engine.routes.url_helpers

  before do
    allow(self).to receive_messages(
      root_path: "/",
      about_path: "/about"
    )
  end

  describe "render" do
    let(:component) { render_inline(described_class.new) }

    it "renders the navbar wrapper" do
      expect(component.css("nav.navbar-ios")).to be_present
    end

    it "renders the logo linking to root_path" do
      expect(component.css("a[href='/']").first).to be_present
    end

    context "when the display desktop menu" do
      it "renders Inicio link" do
        expect(component.css("ul.hidden.md\\:flex a[href='/']").text).to eq("Inicio")
      end

      it "renders Productos link" do
        expect(component.css("ul.hidden.md\\:flex a[href='#productos']").text).to eq("Productos")
      end

      it "renders Nosotros link" do
        expect(component.css("ul.hidden.md\\:flex a[href='/about']").text).to eq("Nosotros")
      end

      it "renders Contacto link" do
        expect(component.css("ul.hidden.md\\:flex a[href='#contacto']").text).to eq("Contacto")
      end

      it "renders Iniciar sesión from engine" do
        href = new_user_session_path
        expect(component.css("ul.hidden.md\\:flex a[href='#{href}']").text).to eq("Iniciar sesión")
      end
    end

    context "when the display mobile menu" do
      it "renders Inicio link" do
        expect(component.css("ul#mobile-menu a[href='/']").text).to eq("Inicio")
      end

      it "renders Iniciar sesión link (engine)" do
        expect(component.css("ul#mobile-menu a[href='#{new_user_session_path}']").text)
          .to eq("Iniciar sesión")
      end
    end
  end
end
