require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @buy = FactoryBot.build(:buy)
  end

  describe '購入登録' do
    context '購入情報を登録できるとき' do
      it '正常な購入情報登録' do
        expect(@buy).to be_valid
      end

      it '建物名が空でも登録できる' do
        @buy.building = nil
        expect(@buy).to be_valid
      end

    end

    context '購入情報を登録できないとき' do
      it '郵便番号が空では登録できない' do
        @buy.postal_code = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号ハイフンなしでは登録出来ない' do
        @buy.postal_code = 111_111
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'tokenが空では登録できない' do
        @buy.token = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Token can't be blank")
      end

      it '都道府県が未選択では登録できない' do
        @buy.prefecture_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県が０を選択していると登録できない' do
        @buy.prefecture_id = 0
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では登録できない' do
        @buy.city = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @buy.addresses = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Addresses can't be blank")
      end

      it '電話番号が空では登録できない' do
        @buy.phone_number = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は半角数字以外は登録できない' do
        @buy.phone_number = '０９０１１１１１１１１'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number Half-width number')
      end

      it '電話番号は11桁以内でないと登録できない' do
        @buy.phone_number = '090111111111111'
        @buy.valid?
        
        expect(@buy.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号はハイフンがあると登録できない' do
        @buy.phone_number = '090-111-111'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Phone number is invalid')
      end

      it 'user_idが空では登録できない' do
        @buy.user_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @buy.item_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
