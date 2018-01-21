class User < ApplicationRecord
  has_many :pets, :foreign_key => 'owner_id'
  has_many :appointments, :foreign_key => 'sitter_id'

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, uniqueness: { case_sensitive: false }

end
