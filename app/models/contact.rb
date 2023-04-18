class Contact < ApplicationRecord
  belongs_to :departament

  validates :name, :telephone, :email, presence: true

  def as_json(options={})
    { :name => self.name,
    :email => self.email,
  :telephone => self.telephone } 
  end
end
