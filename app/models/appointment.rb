class Appointment < ApplicationRecord

  belongs_to :sitter, :class_name => "User"
  belongs_to :cuddle_buddy, :class_name => "Pet"

  validate :valid_dates, :two_hours, :bedtime
  # validate :two_hours
  # validate :bedtime

  def duration
    checkin - checkout
  end

  private

  def two_hours
    if checkout > (checkin.to_time + 2.hours)
      errors.add(:base, "Please limit cuddles to two hours.")
    end
  end


  def bedtime
    checkin_hour = checkin.to_time.hour
    if checkin_hour < 8 || checkin_hour > 18
       errors.add(:base, "Only available from 7am to 6pm.")
    end
  end


  def valid_dates
     if checkin > checkout || checkin == checkout
       errors.add(:base, "End time must be after start time.")
     end
  end

 # def available_dates
 #   if self.checkin && self.checkout
 #    if (self.checkin <= checkout ) && (checkin <= self.checkout)
 #      byebug
 #       errors.add(:appointment, "Not available these dates :(")
 #     end
 #   end
 #  end

end
