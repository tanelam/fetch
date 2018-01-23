class AddCheckinCheckoutColumsToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :checkin, :datetime
    add_column :appointments, :checkout, :datetime
  end
end
