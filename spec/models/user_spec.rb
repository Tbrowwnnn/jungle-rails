require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    before(:each) do @user = User.create(first_name: "Darth", last_name: "Vader", email: "darth.vader@deathstar.com", password: "Darth", password_confirmation: "Darth")
  end

  it 'should be a valid registration' do
  expect(@user).to be_valid
  end 

  it 'should not be valid when password already exists' do
    @user2 = User.create(first_name: "Darth", last_name: "Vader", email: "darth.vader@deathstar.com", password: "Darth", password_confirmation: "Darth")
  expect(@user2).to be_invalid
  end 

  it 'should be invalid even when email is the same but different cases' do
    @user2 = User.create(first_name: "Darth", last_name: "Vader", email: "dArth.vAdEr@DEATHstar.com", password: "Darth", password_confirmation: "Darth")
  expect(@user2).to be_invalid
  end 

  it 'should be invalid with no first name present' do
    @user.first_name = nil
  expect(@user).to be_invalid
  end 

  it 'should be invalid with no last name present' do
    @user.last_name = nil
  expect(@user).to be_invalid
  end 

  it 'should be a invalid with no email present' do
    @user.email = nil
  expect(@user).to be_invalid
  end

  it 'should invalid with no password present' do
    @user.password = nil
    expect(@user).to be_invalid
    end  

  it 'should be invalid with password and confirmation do not match' do
    @user.password_confirmation = "Lukes"
    expect(@user).to be_invalid
    end 

  it 'should be invalid as password is not long enough' do
    @user.password = "Luke"
    @user.password_confirmation = "Luke"
    expect(@user).to be_invalid
    end 
  end

  describe ".authenticate_with_credentials" do

    before(:each) do @user = User.create(first_name: "Darth", last_name: "Vader", email: "darth.vader@deathstar.com", password: "Darth", password_confirmation: "Darth")
    end

      it "should allow user to login" do 
        @session = User.authenticate_with_credentials("darth.vader@deathstar.com", "Darth")
        expect(@session.email).to eql ("darth.vader@deathstar.com")
      end

      it "should not allow user to login" do 
        @session = User.authenticate_with_credentials( "darth.vader@deathstar.com", "Marth")
        expect(@session).to be_nil
    end

    it "should allow user to login even though case is not actual" do 
      @session = User.authenticate_with_credentials("dArth.vAder@DEATHstar.com", "Darth")
      expect(@session.email).to eql ("darth.vader@deathstar.com")
    end

    it "should allow user to login even though there are spaces" do 
      @session = User.authenticate_with_credentials(" dArth.vAder@DEATHstar.com ", "Darth")
      expect(@session.email).to eql ("darth.vader@deathstar.com")
    end
  end
end
