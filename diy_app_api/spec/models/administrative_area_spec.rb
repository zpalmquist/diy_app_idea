require 'rails_helper'

describe AdministrativeArea, type: :model do
  it {should have_many :localities}
  it {should belong_to :country}
end
