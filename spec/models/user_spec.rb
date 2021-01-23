require 'rails_helper'

FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {'test@example'}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'阿阿'}
    first_name            {'井伊'}
    last_name_kana        {'アア'}
    first_name_kana       {'イイ'}
    birthday              {'2000-02-20'}
  end
end

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context 'うまくいく場合' do
      it '正常な新規登録' do
        @user
      end
    end

    context 'うまくいかない場合' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailに＠が含まれていないと登録出来ない' do
      @user.email = "testexample"
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空だと登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが５文字以下だと登録出来ない' do
      @user.password = "aa111"
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは英語のみでは登録できないこと' do
      @user.password = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字混合のみ登録できる。")
    end
    it 'passwordは数字のみでは登録できないこと' do
      @user.password = "11111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字混合のみ登録できる。")
    end
    it 'passwordは全角では登録できないこと' do
      @user.password = "１１１１１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字混合のみ登録できる。")
    end
    it 'passwordとpassword_confirmationが一致してないと登録出来ない' do
      @user.password = "11111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameは漢字・平仮名・カタカナ以外では登録できない' do
      @user.last_name = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameは漢字・平仮名・カタカナ以外では登録できない' do
      @user.first_name = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'last_name_kanaは全角カタカナ以外では登録できないこと' do
      @user.last_name_kana = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
    end
    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaは全角カタカナ以外では登録できないこと' do
      @user.first_name_kana = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
    end
    it 'birthdayが空だと登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end

  end
end

