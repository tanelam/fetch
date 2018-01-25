module ApplicationHelper

  def dogs
    @dogs = Pet.all.select { |pet| pet.species_id == 1 }
    @dogs.count
  end

  def cats
    @cats = Pet.all.select { |pet| pet.species_id == 2 }
    @cats.count
  end

  def rabbits
    @rabbits = Pet.all.select { |pet| pet.species_id == 3 }
    @rabbits.count
  end

  def lizards
    @lizards = Pet.all.select { |pet| pet.species_id == 4 }
    @lizards.count
  end

  def total_pets
    @total = Pet.all
  end

  def avg_appointment_length
    all_appointments = Appointment.all
    hours = all_appointments.map { |appointment| appointment.duration }
    average_float = hours.inject(0.0) { |sum, el| sum + el } / hours.size
    rounded_float = (average_float*100).round / 100.0
  end

  def most_popular_animal
    appointments = Appointment.all
    app_species = appointments.map {|appointment| appointment.cuddle_buddy.species }
    app_species.sort.first.name
  end

end
