class Item < ApplicationRecord
  has_many :processings
  validates :name, presence: true
  validates :price, presence: true, uniqueness: true
end
