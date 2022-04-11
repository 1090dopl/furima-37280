require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user=FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
     it "nickname:必須" do
      @user.nickname=''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
     it "email:必須" do
       @user.email=''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
    end
      it "password:必須" do
        @user.password=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank") 
      end 
      it "first_name_reading:必須" do
        @user.first_name_reading=''
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("First_name_reading can't be blank")
      end
      it "last_name_reading:必須" do
        @user.last_name_reading=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last_name_reading can't be blank")
      end
      it "birthday:必須" do
        @user.birthday=''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
 end

p