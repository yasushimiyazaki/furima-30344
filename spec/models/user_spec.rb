require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
   context 'うまくいく場合' do
    it '正常な新規登録' do
      user = User.new(nickname: 'test', email: 'test＠example', password: '000aaa', password_confirmation: '000aaa',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
    end
  end
   context 'うまくいかない場合' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000aaa', password_confirmation: '000aaa')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000aaa', password_confirmation: '000aaa')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに＠が含まれていないと登録出来ない' do
      user = User.new(nickname: 'test', email: 'testexample', password: '000aaa', password_confirmation: '000aaa',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '000aaa')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが５文字以下だと登録出来ない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000aa', password_confirmation: '000aa',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは英語のみでは登録できないこと' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'aaaaaaa', password_confirmation: 'aaaaaaa',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("Password は半角英数字混合のみ登録できる。")
    end
    it 'passwordは数字のみでは登録できないこと' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("Password は半角英数字混合のみ登録できる。")
    end
    it 'passwordは全角では登録できないこと' do
      user = User.new(nickname: 'test', email: 'test@example', password: '００００００', password_confirmation: '００００００',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("Password は半角英数字混合のみ登録できる。")
    end
    it 'passwordとpassword_confirmationが一致してないと登録出来ない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000aaa', password_confirmation: '00aaaa',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000aaa', password_confirmation: '000aaa',
                      last_name: '', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameは漢字・平仮名・カタカナ以外では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000aaa', password_confirmation: '000aaa',
                      last_name: 'a', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
    it 'first_nameが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000aaa', password_confirmation: '000aaa',
                      last_name: '阿阿', first_name: '', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameは漢字・平仮名・カタカナ以外では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000aaa', password_confirmation: '000aaa',
                      last_name: '阿阿', first_name: 'i', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
    it 'last_name_kanaが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000aaa', password_confirmation: '000aaa',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: '', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'last_name_kanaは全角カタカナ以外では登録できないこと' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000aaa', password_confirmation: '000aaa',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'a', first_name_kana: 'イイ', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
    end
    it 'first_name_kanaが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000aaa', password_confirmation: '000aaa',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: '', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaは全角カタカナ以外では登録できないこと' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000aaa', password_confirmation: '000aaa',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'i', birthday: '2000-02-20')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
    end
    it 'birthdayが空だと登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000aaa', password_confirmation: '000aaa',
                      last_name: '阿阿', first_name: '井伊', last_name_kana: 'アア', first_name_kana: 'イイ', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
   end
  end  
end
