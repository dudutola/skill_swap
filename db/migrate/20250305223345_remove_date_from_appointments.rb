class RemoveDateFromAppointments < ActiveRecord::Migration[7.1]
  def change
    remove_column :appointments, :date, :string
  end
end
