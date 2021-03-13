class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id,:user_id, :order_id, :postcode, :city, :building,:phone_number, :prefecture_id, :area,:token

  with_options presence: true do
    validates :item_id
    validates :postcode, format:{with: /\A\d{3}-\d{4}\z/} 
    validates :city
    validates :phone_number, length: {maximum: 11 }
    validates :phone_number, numericality: { only_integer: true }
    validates :prefecture_id, numericality:{ other_than: 0 }
    validates :area
    validates :token
    validates :user_id
  end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, city: city, building: building, phone_number: phone_number, prefecture_id: prefecture_id, area: area, order_id: order.id)
  end

end