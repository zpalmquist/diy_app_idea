## This model represents the US equivalent of States
## Or Canada equivalent of Territories

class AdministrativeArea < ApplicationRecord
  belongs_to :country
  has_many :localities
  validates :name, presence: true
end
