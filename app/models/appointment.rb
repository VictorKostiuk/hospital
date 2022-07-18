class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  enum referral: {procedures: 0, medicine: 1, operation: 2}
end
