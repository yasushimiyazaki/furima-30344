require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに＠が含まれていないと登録出来ない' do
      user = User.new(nickname: 'test', email: 'testexample', password: '000000', password_confirmation: '000000',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが５文字以下だと登録出来ない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '00000', password_confirmation: '00000',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationが一致してないと登録出来ない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '00000',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000',
                      last_name: '', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000',
                      last_name: '阿阿', first_name: '', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: '', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: '', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birthdayが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
