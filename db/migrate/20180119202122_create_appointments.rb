class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.date :begin
      t.date :end
      t.belongs_to :user 
      t.timestamps
    end
  end
end
