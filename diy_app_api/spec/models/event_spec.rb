require 'rails_helper'

describe Event, type: :model do
  it {should have_many :bands}
  it {should belong_to :venue}
end
