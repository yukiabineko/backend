class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, uniqueness: true
end
