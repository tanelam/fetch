require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { described_class.new(user_name: "Anything", password: "some_password") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a user_name" do
      subject.user_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
  
  describe "Associations" do
    it { should have_many(:pets) }
    it { should have_many(:appointments) }
    it { should have_many(:cuddle_buddies) }
  end
end
