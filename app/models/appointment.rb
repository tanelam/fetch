class Appointment < ApplicationRecord
  belongs_to :sitter, :class_name => "User"
  belongs_to :cuddle_buddy, :class_name => "Pet"
end
