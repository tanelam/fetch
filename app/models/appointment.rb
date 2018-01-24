class Appointment < ApplicationRecord

  belongs_to :sitter, :class_name => "User"
  belongs_to :cuddle_buddy, :class_name => "Pet"

  validate :valid_dates

  def duration
    checkin - checkout
  end

  private

  def valid_dates
   # if self.checkin && self.checkout
     if checkin > checkout || checkin == checkout
       errors.add(:appointment, "Startime cannot be after Endtime.")
     end
   # end
  end

 def available_dates
   if self.checkin && self.checkout
    if (self.checkin <= checkout ) && (checkin <= self.checkout)
      byebug
       errors.add(:appointment, "Not available these dates :(")
     end
   end
  end

end
