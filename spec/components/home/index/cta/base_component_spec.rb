# frozen_string_literal: true

require "rails_helper"

RSpec.describe Home::Index::Cta::BaseComponent, type: :component do
  let(:params) do
    {
      title: "Título personalizado",
      subtitle: "Subtítulo personalizado",
      primary_url: "/signup",
      secondary_url: "/demo"
    }
  end

  let(:component) { described_class.new(**params) }
  let(:rendered) { render_inline(component) }

  describe "render" do
    it "renders the wrapper section" do
      expect(rendered.css("section.py-20.bg-gray-50")).to be_present
    end

    it "renders the title" do
      expect(rendered.text).to include(params[:title])
    end

    it "renders the subtitle" do
      expect(rendered.text).to include(params[:subtitle])
    end

    it "renders the primary button with the correct URL" do
      primary_btn = rendered.css("a[href='#{params[:primary_url]}']").first
      expect(primary_btn.text).to eq("Comenzar prueba gratuita")
    end

    it "renders the secondary button with the correct URL" do
      secondary_btn = rendered.css("a[href='#{params[:secondary_url]}']").first
      expect(secondary_btn.text).to eq("Solicitar demo")
    end

    it "applies disabled / visual classes to buttons" do
      btn = rendered.css("a").first
      expect(btn["class"]).to include("cursor-not-allowed")
      expect(btn["class"]).to include("opacity-50")
    end
  end
end
