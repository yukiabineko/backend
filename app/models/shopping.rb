class Shopping < ApplicationRecord
  belongs_to :user

  #受け取り時間設定

  def receiving(hour, min)
    time = Time.local(
      Time.new.year,
      Time.new.month,
      Time.new.day,
      hour,
      min,0
    )
  end
  
end
