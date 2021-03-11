class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id,:user_id, :order_id, :postcode, :city, :building,:phone_number, :prefecture_id, :area

  with_options presence: true do
    validates :item_id
    validates :order_id
    validates :postcode, format{with: 
    validates :city
    validates :phone_number, format{with: }
    validates :prefecture_id, numericality:{other_than: 0 }
    validates :area
  end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    binding.pry
    Address.create(postcode: postcode, city: city, building: building, phone_number: phone_number, prefecture_id: prefecture_id, area: area, order_id: order.id)
  end

end