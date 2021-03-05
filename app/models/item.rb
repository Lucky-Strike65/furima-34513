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
    validates :price,            numericality: { other_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :category_id,      numericality: { other_than: 1 }
    validates :burden_id,        numericality: { other_than: 1 }
    validates :source_id,        numericality: { other_than: 0 }
    validates :days_to_ship_id,  numericality: { other_than: 1 }
    validates :item_description
    validates :condition_id,        numericality: { other_than: 1 }
  end
end
