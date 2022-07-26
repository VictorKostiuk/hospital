class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:first_name, :last_name, :email,
                                                                             :password, :password_confirmation]
  has_many :appointments
  has_many :medicine_participants, as: :participatable
  has_many :doctors, through: :appointments
  STATUSES = [:in_hospital, :discharged]
end
