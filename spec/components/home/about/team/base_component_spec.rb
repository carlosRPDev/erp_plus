# frozen_string_literal: true

require "rails_helper"

RSpec.describe Home::About::Team::BaseComponent, type: :component do
  describe "#team_members" do
    it "returns an array with at least one member" do
      component = described_class.new
      members = component.send(:team_members)

      expect(members).to be_an(Array)
      expect(members.first[:name]).to eq("Carlos Rodríguez")
      expect(members.first[:role]).to eq("CoFundador & CTO")
      expect(members.first[:image]).to be_present
    end
  end

  describe "#team_grid_classes" do
    let(:component) { described_class.new }

    it "returns 'justify-center' when there is 1 member" do
      result = component.send(:team_grid_classes, [ {} ])
      expect(result).to eq("justify-center")
    end

    it "returns 2-column classes when there are 2 members" do
      result = component.send(:team_grid_classes, [ {}, {} ])
      expect(result).to eq("grid-cols-1 sm:grid-cols-2")
    end

    it "returns 3-column classes when there are 3 members" do
      result = component.send(:team_grid_classes, [ {}, {}, {} ])
      expect(result).to eq("grid-cols-1 sm:grid-cols-3")
    end

    it "returns 4-column responsive grid when more than 3 members" do
      result = component.send(:team_grid_classes, [ {}, {}, {}, {} ])
      expect(result).to eq("grid-cols-1 sm:grid-cols-2 md:grid-cols-4")
    end
  end

  describe "rendering" do
    it "renders successfully and includes the team member name" do
      render_inline(described_class.new)

      expect(page).to have_text("Carlos Rodríguez")
      expect(page).to have_text("Fundador & CTO")
    end

    it "applies correct grid classes" do
      render_inline(described_class.new)

      expect(page).to have_css("[class*='justify-center']").or \
                      have_css("[class*='grid-cols-1']")
    end
  end
end
