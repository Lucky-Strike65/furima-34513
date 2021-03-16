require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿' do
    context '商品を出品ができるとき' do
      it 'imageとnameとitem_descriptionとcategory_idとburden_idとprefecture_idとpriceが存在すれば投稿できる' do
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
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'nameが空では投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'item_descriptionが空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idのidが０なら投稿できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは---以外を選択してください')
      end
      it 'condition_idのidが０なら投稿できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は---以外を選択してください')
      end
      it 'burden_idのidが0なら投稿できない' do
        @item.burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は---以外を選択してください")
      end
      it 'prefecture_idのidが0なら投稿できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域は---以外を選択してください')
      end
      it 'days_to_ship_idのidが0なら投稿できない' do
        @item.days_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数は---以外を選択してください')
      end
      it 'priceが空では投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'priceが全角数字なら投稿できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceが漢字だと投稿できない' do
        @item.price = '一万円'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceが299以下だと投稿できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceが10000000以上だと投稿できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
    end
  end
end
