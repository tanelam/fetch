class Pet < ApplicationRecord
<<<<<<< HEAD

  mount_uploader :pet_photo, PetPhotoUploader

  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  belongs_to :species
  has_many :appointments, :foreign_key => 'cuddle_buddy_id'
  has_many :sitters, :class_name => "User", :through => :appointments

  validates :name, :species_id, :bio, presence: true

=======
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :appointments
  has_many :sitters, :class_name => "User", :through => :appointments

>>>>>>> 77328bb308cf83b12a395d60c48772007b27532d
end
