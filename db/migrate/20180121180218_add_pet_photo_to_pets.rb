class AddPetPhotoToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :pet_photo, :string
  end
end
