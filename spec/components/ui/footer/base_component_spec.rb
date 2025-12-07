# frozen_string_literal: true

require "rails_helper"

RSpec.describe Ui::Footer::BaseComponent, type: :component do
  subject(:component) { described_class.new }

  let(:doc) { Nokogiri::HTML.parse(rendered_content) }

  describe "render" do
    before { render_inline(component) }

    it "renders the footer element" do
      expect(doc.css("footer.bg-gray-900")).not_to be_empty
    end

    it "shows the copyright text with the current year" do
      expect(doc.to_html).to include("© #{Time.current.year} ERP+ — Todos los derechos reservados")
    end

    it "shows the author signature" do
      expect(doc.to_html).to include("Hecho con ❤️ por Carlos Rodriguez")
    end
  end
end
