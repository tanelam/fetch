class Appointment < ApplicationRecord
<<<<<<< HEAD
  belongs_to :sitter, :class_name => "User"
  belongs_to :cuddle_buddy, :class_name => "Pet"
=======
  belongs_to :pet
  belongs_to :sitter, :class_name => "User"
>>>>>>> 77328bb308cf83b12a395d60c48772007b27532d
end
