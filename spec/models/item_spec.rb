require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できるとき' do
      it '全て正しく入力すると登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録出来ないとき' do
      it '画像が空では登録出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では登録出来ない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品説明が空では登録出来ない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end
      it 'カテゴリーが空では登録出来ない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が空では登録出来ない' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Sales status can't be blank"
      end
      it '配送料の負担が空では登録出来ない' do
        @item.sipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Sipping fee status can't be blank"
      end
      it '発送元の地域が空では登録出来ない' do
        @item.sipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Sipping fee status can't be blank"
      end
      it '発送までの日数が空では登録出来ない' do
        @item.scheduled_delivery = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled delivery can't be blank"
      end
      it '価格が空では登録出来ない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '半角英数混合では登録できないこと' do
        @item.price = '100abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it '半角英字だけでは登録できないこと' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it '価格は半角数字以外では登録出来ない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Half-width number'
      end
      it '価格は300未満では登録出来ない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it '価格は10000000以上は登録出来ない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it '価格は300〜9999999以外では登録出来ない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range'
      end
      it 'カテゴリーが未選択では登録出来ない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end
      it '商品の状態が未選択では登録出来ない' do
        @item.sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Sales status Select'
      end
      it '配送料の負担が未選択では登録出来ない' do
        @item.sipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Sipping fee status Select'
      end
      it '配送元の地域が未選択では登録出来ない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture Select'
      end
      it '発送までの日数が未選択では登録出来ない' do
        @item.scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Scheduled delivery Select'
      end
    end
  end
end
