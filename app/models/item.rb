class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one    :order
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :source
  belongs_to :burden
  belongs_to :days_to_ship

  with_options presence: true do
    validates :name
    validates :item_description
    validates :price, numericality: { other_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} do
    with_options numericality: {other_than: 0} do
      validates :category_id
      validates :burden_id
      validates :source_id
      validates :days_to_ship_id
      validates :condition_id
    end
  end
end
