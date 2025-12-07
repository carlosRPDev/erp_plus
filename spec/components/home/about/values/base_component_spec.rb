# frozen_string_literal: true

require "rails_helper"

RSpec.describe Home::About::Values::BaseComponent, type: :component do
  describe "#initialize" do
    it "sets @alternate by default" do
      component = described_class.new
      expect(component.instance_variable_get(:@alternate)).to be(true)
    end

    it "allows overriding @alternate" do
      component = described_class.new(alternate: false)
      expect(component.instance_variable_get(:@alternate)).to be(false)
    end
  end

  describe "#values" do
    it "returns an array with the expected structure" do
      component = described_class.new

      result = component.send(:values)

      expect(result).to be_an(Array)
      expect(result.first).to include(:title, :desc, :image)
    end
  end

  describe "rendering" do
    it "renders successfully" do
      render_inline(described_class.new)

      expect(page).to be_present
    end
  end
end
