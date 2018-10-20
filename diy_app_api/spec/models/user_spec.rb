require 'rails_helper'

describe User, type: :model do
  let(:user) { create :user }

  context "relationships" do
    it { should have_many :bands }
    it { should have_many :venues }
  end

  context "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:uid) }
  end
end
