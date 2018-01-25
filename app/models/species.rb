class Species < ApplicationRecord
  validates_presence_of :name
  has_many :pets
  validates :name, uniqueness: true

end
