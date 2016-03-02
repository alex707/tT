require 'rails_helper'

describe User do

  it "should validate presence" do
  #  is_expected.to validate_presence_of :email
  expect( FactoryGirl.create(:user) ).to be_valid
  end 

end
