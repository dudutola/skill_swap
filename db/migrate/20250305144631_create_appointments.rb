class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.string :date
      t.references :tutor, null: false, foreign_key: { to_table: :users }
      t.references :pupil, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
