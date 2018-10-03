require "rails_helper"

RSpec.describe Category, type: :model do
  let!(:category_1) {create :category}
  let!(:category_2) {create(:category, name: "Weather")}

  context "validations" do
    describe "name validations" do
      it {should validate_presence_of(:name)}
      it {should validate_length_of(:name).is_at_most(50)}
    end

    describe "description validations" do
      it {should validate_presence_of(:description)}
      it {should validate_length_of(:description).is_at_most(150)}
    end
  end

  context "associations" do
    it {is_expected.to have_many :words}
    it {is_expected.to have_many :notifications}
  end

  describe ".load_categories" do
    it "sorts the records by name" do
      expect(Category.load_categories).to eq [category_1, category_2]
    end

    it "do not sort the records by name" do
      expect(Category.load_categories).not_to eq [category_2, category_1]
    end
  end
end
