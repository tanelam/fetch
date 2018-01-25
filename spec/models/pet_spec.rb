require 'rails_helper'

 RSpec.describe Pet, :type => :model do

   let(:owner) { User.create(:user_name => "Falafel", :password => "pw1234") }
   let(:species) { Species.create(:name => "Cute Animal") }

   subject { described_class.create(name: "Anything", bio: "Something", owner: owner, species: species) }

    describe "Validations" do
     it { should validate_presence_of(:owner) }
     it { should validate_presence_of(:species) }

     it "is valid with valid attributes" do
       expect(subject).to be_valid
     end

     it "is not valid without a name" do
       subject.name = nil
       expect(subject).to_not be_valid
     end

     it "is not valid without a bio" do
       subject.bio = nil
       expect(subject).to_not be_valid
     end

     it "is not valid without a owner" do
       subject.owner = nil
       expect(subject).to_not be_valid
     end

     it "is not valid without a species" do
       subject.species = nil
       expect(subject).to_not be_valid
     end
   end

   describe "Associations" do
     it { should belong_to(:owner) }
     it { should belong_to(:species) }
     it { should have_many(:appointments) }
     it { should have_many(:sitters) }
   end
 end
