require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user_attr = FactoryBot.attributes_for(:user)
    @user = FactoryBot.build(:user)
  end

  it "should create a new user" do
    User.create!(@user_attr)
  end
end
