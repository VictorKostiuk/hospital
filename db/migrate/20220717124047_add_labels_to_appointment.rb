class AddLabelsToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :topic, :string
    add_column :appointments, :diagnosis, :string
    add_column :appointments, :referral, :integer
  end
end
