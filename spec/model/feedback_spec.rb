require "rails_helper"

RSpec.describe Feedback, type: :model do
  let(:feedback) { build(:feedback) }
 
  it "should be valid feedback" do
    expect(feedback).to be_valid
  end

  it "validates email format" do
    feedback = build(:feedback)
    feedback.email = "invalid_email"
    expect(feedback).not_to be_valid
    expect(feedback.errors[:email]).to include("is invalid")
  end

  it "Add feedback in database" do
    record = build(:feedback)
    expect { record.save }.to change { Feedback.count }.by(1)
    expect(record.id.present?).to eq(true)
  end

end
