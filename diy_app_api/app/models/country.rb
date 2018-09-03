class Country < ApplicationRecord
  has_many :administrative_areas
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
