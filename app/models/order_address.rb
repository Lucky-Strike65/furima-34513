class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id,:user_id, :order_id, :postcode, :city, :building,:phone_number, :prefecture_id, :area,:token

  with_options presence: true do
    validates :item_id
    validates :postcode, format:{with: /\d{3}-\d{4}/} 
    validates :city
    validates :phone_number,format:{with: /\A\d{11}\z/}
    validates :prefecture_id, numericality:{ other_than: 0 }
    validates :area
    validates :token
  end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, city: city, building: building, phone_number: phone_number, prefecture_id: prefecture_id, area: area, order_id: order.id)
  end

end