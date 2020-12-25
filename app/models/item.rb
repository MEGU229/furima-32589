class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :user
  has_one_attached :image

 with_options presence: true do
  validates :name, length: { maximum: 40 }
  validates :text, length: { maximum: 1000 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :image
 end

 with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :condition_id
  validates :prefecture_id
  validates :days_to_ship_id
  validates :shipping_cost_id
 end

end
