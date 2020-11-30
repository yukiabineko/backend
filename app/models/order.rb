class Order < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  scope :rent, -> { order(created_at: :ASC)}
end
