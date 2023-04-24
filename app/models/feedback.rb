class Feedback < ApplicationRecord
  EMAIL_REGEXP = /\A[a-z0-9\.\-]+@[a-z0-9]+\.[a-z]+\z/

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, format: { with: EMAIL_REGEXP }
  validates :message, :title, presence: true
end
