class AddBioToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :bio, :text
  end
end
