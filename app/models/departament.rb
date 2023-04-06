class Departament < ApplicationRecord
    has_many :contacts

    validates :title, presence: true

end
