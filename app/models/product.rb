class Product < ApplicationRecord
  presence  validates :title, presence: true
  validates :price, presence: true
  validates :stock_quantity, presence: true
end
