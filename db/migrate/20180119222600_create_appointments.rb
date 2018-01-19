class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.integer :cuddle_buddy_id
      t.integer :sitter_id
      t.timestamps
    end
  end
end
