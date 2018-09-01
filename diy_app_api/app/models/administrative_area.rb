## This model represents the US equivalent of States

class AdministrativeArea < ApplicationRecord
  belongs_to :country
  has_many :localities
end
