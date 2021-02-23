class Item < ApplicationRecord
  has_many :processings
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true

  def item_processing_array
    str = ""
    self.processings.all.each do |process|
     str += process.processing_name + ','
    end
    return str
  end
end
