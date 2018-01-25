class User < ApplicationRecord
  has_secure_password
  validates_presence_of :password, :user_name
  has_many :pets, :foreign_key => 'owner_id'
  has_many :appointments, :foreign_key => 'sitter_id'
  has_many :cuddle_buddies, :class_name => "Pet", :through => :appointments

  validates :user_name, presence: true
  validates :user_name, uniqueness: true
  validates :user_name, uniqueness: { case_sensitive: false }
  validates :user_name, format: {without: /\s/, message:"must contain no spaces"}

  validates :password, presence: true, length: { minimum: 6 }

  # accepts_nested_attributes_for :pets

end
