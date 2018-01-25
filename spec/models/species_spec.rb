require 'rails_helper'

RSpec.describe Species, :type => :model do
  subject { described_class.new(name: "Anything") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should have_many(:pets) }
  end
end
