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

  ##登録時加工被りあるかチェック

 def existing_process_check(set_process)
   result = true
   self.processings.each do |process|
     if set_process == process
       result = false
     end
   end
   return result
 end

end
