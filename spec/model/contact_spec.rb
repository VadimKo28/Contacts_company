require "rails_helper"

RSpec.describe Contact, type: :model do
  let(:contact) { build(:contact) }

  let!(:departament) { create(:departament) }

  it "unless code is not unique" do
    @attributes = {
      name: "John Doe",
      email: "john.doe@example.com",
      telephone: "555-555-5555",
      departament: departament,
    }

    @contact = Contact.create(@attributes)
    @same_contact = Contact.create(@attributes)
    expect(@same_contact).to_not be_valid
  end

  it "has valid factory" do
    expect(contact).to be_valid
  end

  it "is not valid without a name" do
    contact.name = nil
    expect(contact).to_not be_valid
  end

  it "is invalid without an email" do
    contact = Contact.new(email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a telephone" do
    contact = Contact.new(telephone: nil)
    contact.valid?
    expect(contact.errors[:telephone]).to include("can't be blank")
  end

  it "is invalid without a departament" do
    contact = Contact.new(
      name: "John Doe",
      email: "john.doe@example.com",
      telephone: "555-555-5555",
      departament: nil,
    )
    contact.valid?
    expect(contact.errors[:departament]).to include("must exist")
  end

  it "Add contact in database" do
    record = build(:contact)
    expect { record.save }.to change { Contact.count }.by(1)
    expect(record.id.present?).to eq(true)
  end

  it "Update contact in database" do
    record = create(:contact)
    record.update_attribute(:name, "Update name test user")
    expect(record.name).to eq("Update name test user")
  end

  it "Remove contact in database" do
    record = create(:contact)
    expect { record.destroy }.to change { Contact.count }.by(-1)
    expect(Contact.exists?(record.id)).to be_falsey
  end

  it "returns expected JSON output" do
    expected_output = {
      name: "Test User",
      email: "test@example.com",
      telephone: "111-111-1111",
    }.to_json

    expect(contact.as_json.to_json).to eq(expected_output)
  end
end
