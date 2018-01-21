class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.integer :sitter_id
      t.belongs_to :pet
      t.timestamps
    end
  end
end
