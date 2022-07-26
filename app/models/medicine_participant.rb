class MedicineParticipant < ApplicationRecord
  belongs_to :appointment
  belongs_to :participatable, polymorphic: true
end
