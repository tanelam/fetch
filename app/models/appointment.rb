class Appointment < ApplicationRecord
  belongs_to :pet
  belongs_to :sitter, :class_name => "User"
end
