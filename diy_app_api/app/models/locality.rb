## This model is used to represent cities / towns
## Naming is for the fact that not all countries have 'cities'

class Locality < ApplicationRecord
  belongs_to :administrative_area
  has_many :bands
  has_many :venues
end
