class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has__one_attached :image

end
