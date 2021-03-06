require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿' do
    context '商品を出品ができるとき' do
      it 'imageとnameとitem_descriptionとcategory_idとburden_idとsource_idとpriceが存在すれば投稿できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字なら登録できる' do
        @item.price = '1000'
        expect(@item).to be_valid
      end
    end

    context '商品が出品ができないとき' do
      it 'imageが空では投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'item_descriptionが空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'category_idのidが０なら投稿できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it 'condition_idのidが０なら投稿できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it 'burden_idのidが0なら投稿できない' do
        @item.burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 0")
      end
      it 'source_idのidが0なら投稿できない' do
        @item.source_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Source must be other than 0")
      end
      it 'days_to_ship_idのidが0なら投稿できない' do
        @item.days_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 0")
      end
      it 'priceが空では投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字なら投稿できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが漢字だと投稿できない' do
        @item.price = '一万円'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが299以下だと投稿できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10000000以上だと投稿できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
