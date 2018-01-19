class User < ApplicationRecord
# has_many :pets, :foreign_key => 'sitter_id'
has_many :pets, :foreign_key => 'owner_id'
# has_many :reservations, :through => :listings

has_many :reviews, :foreign_key => 'sitter_id'
has_many :reviews, :foreign_key => 'owner_id'

has_many :appointments, :foreign_key => 'sitter_id'
has_many :appointments, :foreign_key => 'owner_id'

end
