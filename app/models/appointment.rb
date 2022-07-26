class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_many :medicine_participants
  enum referral: {nothing_to_do: 0, procedures: 1, medicine: 2, operation: 3}
end
