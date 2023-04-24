require "rails_helper"

RSpec.describe Departament, type: :model do
    let(:departament) { build(:departament) }

  it "has valid factory" do
    expect(departament).to be_valid
  end

  it "is not valid without a name" do
    departament.title = nil
    expect(departament).to_not be_valid
  end

end
