class Contact < ApplicationRecord
  belongs_to :departament

  validates :name, :telephone, :email, presence: true
end
