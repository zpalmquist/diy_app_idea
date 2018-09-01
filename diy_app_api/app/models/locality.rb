## This model is used to represent cities / towns

class Locality < ApplicationRecord
  belongs_to :administrative_area
  has_many :bands
  has_many :venues
end
