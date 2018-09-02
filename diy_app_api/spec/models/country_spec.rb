require 'rails_helper'

describe Country, type: :model do
  it {should have_many :administrative_areas}
end
