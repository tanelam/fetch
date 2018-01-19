class User < ApplicationRecord

  has_many :pets, :foreign_key => 'owner_id'


  has_many :appointments, :foreign_key => 'sitter_id'

  has_many :cuddle_buddies, :class_name => "Pet", :through => :appointments


end
