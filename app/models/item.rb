class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has__one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,     numericality: { other_than: 1 }
  belongs_to :condition,    numericality: { other_than: 1 }
  belongs_to :sorce,        numericality: { other_than: 1 }
  belongs_to :burden,       numericality: { other_than: 1 }
  belongs_to :days_to_ship, numericality: { other_than: 1 }

  with_options presence: ture do
    validates :name
    validates :price
    validates :category_id
    validates :burden_id
    validates :source_id
    validates :days_to_ship_id
    validates :item_description
  end
end
