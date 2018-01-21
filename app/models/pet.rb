class Pet < ApplicationRecord
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :appointments
  has_many :sitters, :class_name => "User", :through => :appointments

end
