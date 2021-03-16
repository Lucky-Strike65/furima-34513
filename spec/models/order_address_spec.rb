require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id )
    sleep 0.1
  end

  describe '商品を購入' do
    context '商品が購入できる時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@order_address).to be_valid
      end
      it 'bulidingが空でも登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'tokenが空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'postcodeが空では購入できない' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postcodeに半角-(ハイフン)を含んだ正しい形でないと購入できない' do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'prefecture_idのidが0では購入できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県は---以外を選択してください")
      end
      it'prefecture_idが空だと購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください")
      end

      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市町村を入力してください")
      end
      it 'areaが空だと購入できない' do
        @order_address.area = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが全角数字なら購入できない' do
        @order_address.phone_number = '０１０１２３４１２３４'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は数値で入力してください")
      end
      it 'phone_numberがハイフンが入ると購入できない' do
        @order_address.phone_number = '010-14-1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は数値で入力してください")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @order_address.phone_number = '111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は11文字以内で入力してください")
      end
      it 'phone_numberが英数混合で購入できない' do
        @order_address.phone_number = 'abc12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号は数値で入力してください")
      end
      it 'user_idが紐づかないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが紐づかないと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end

