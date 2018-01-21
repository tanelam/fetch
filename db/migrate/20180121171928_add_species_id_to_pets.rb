class AddSpeciesIdToPets < ActiveRecord::Migration[5.1]
  def change
    add_reference :pets, :species, foreign_key: true
  end
end
