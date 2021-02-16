require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '購入登録' do
    context '購入情報を登録できるとき' do
      it 'priceとtokenがあれば保存ができること' do
        expect(@order).to be_valid
      end
    end

    context '購入情報を登録できるとき' do
      it 'priceが空では登録できないこと' do
        @order.price = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Price can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
