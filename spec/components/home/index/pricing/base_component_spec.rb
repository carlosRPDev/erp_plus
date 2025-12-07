# frozen_string_literal: true

require "rails_helper"

RSpec.describe Home::Index::Pricing::BaseComponent, type: :component do
  subject(:component) { described_class.new(plans: plans) }

  let(:plans) do
    [
      {
        title: "Básico",
        description: "Ideal para emprendedores",
        price: "$19/mes",
        features: [ "1 usuario", "Inventario limitado" ],
        cta_text: "Elegir plan",
        cta_link: "/signup-basic"
      },
      {
        title: "Pro",
        description: "Para pequeñas empresas",
        price: "$49/mes",
        features: [ "5 usuarios", "Inventario avanzado" ],
        cta_text: "Elegir plan",
        cta_link: "/signup-pro"
      }
    ]
  end

  let(:doc) { Nokogiri::HTML.parse(rendered_content) }

  describe "render" do
    before { render_inline(component) }

    it "renders the main pricing section" do
      expect(doc.css("section.bg-gray-50")).not_to be_empty
    end

    it "renders the section title" do
      expect(doc.css("h2").text).to include("Nuestros planes")
    end

    it "renders all plans" do
      expect(doc.css("div.grid > div").count).to eq(plans.size)
    end

    it "renders plan titles" do
      plans.each do |plan|
        expect(doc.to_html).to include(plan[:title])
      end
    end

    it "renders plan descriptions" do
      plans.each do |plan|
        expect(doc.to_html).to include(plan[:description])
      end
    end

    it "renders plan prices" do
      plans.each do |plan|
        expect(doc.to_html).to include(plan[:price])
      end
    end

    it "renders plan features" do
      plans.each do |plan|
        plan[:features].each do |feature|
          expect(doc.to_html).to include(feature)
        end
      end
    end

    it "renders CTA buttons with correct text" do
      plans.each do |plan|
        expect(doc.to_html).to include(plan[:cta_text])
      end
    end

    it "renders CTA buttons with correct links" do
      plans.each do |plan|
        expect(doc.css("a[href='#{plan[:cta_link]}']")).not_to be_empty
      end
    end
  end
end
