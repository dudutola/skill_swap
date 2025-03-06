class AddStartTimeEndTimeAndIssueToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_reference :appointments, :issue, null: false, foreign_key: true
    add_column :appointments, :start_time, :datetime
    add_column :appointments, :end_time, :datetime
  end
end
