class Review < ApplicationRecord
  belongs_to :patient
  validates :title, presence: true
  validates :body, presence: true
end
