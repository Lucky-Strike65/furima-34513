class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id,:user_id, :order_id, :postcode, :city, :building,:phone_number, :prefecture_id, :area

  with_options presence: true do
    validates :item_id
    validates :order_id
    validates :postcode
    validates :city
    validates :phone_number
    validates :prefecture_id
    validates :area
  end
end