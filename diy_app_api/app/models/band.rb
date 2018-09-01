class Band < ApplicationRecord
  has_one_attached :profile_pic
  
  has_many :user_bands
  has_many :users, through: :user_bands

  # has_and_belongs_to_many :users

  belongs_to :locality
end
