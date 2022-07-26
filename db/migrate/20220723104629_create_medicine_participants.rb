class CreateMedicineParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :medicine_participants do |t|
      t.references :participatable, polymorphic: true, null: false
      t.belongs_to :appointment

      t.timestamps
    end
  end
end
