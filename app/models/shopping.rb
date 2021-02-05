class Shopping < ApplicationRecord
  belongs_to :user
  Week = %w('日' '月' '火' '水' '木' '金' '土')


  def self.sale_data(params)
    array = []
    first_day = params.present? ?Date.parse(params).beginning_of_month : Date.today.beginning_of_month
    lase_day = first_day.end_of_month
   
    datas = where(status: 2).where(shopping_date: first_day .. lase_day).order(shopping_date: :ASC)
    (first_day .. lase_day).each do |day|
       hash = {}
       hash[:day] = day.strftime('%Y/%m/%d')
       hash[:week] = Week[day.wday]
       num_total = 0
       price_total = 0

      datas.each do |data|
        if  day. == Date.parse(data.shopping_date)
          hash[:num] = num_total += data.num.to_i
          hash[:total] = price_total += (data.price.to_i * data.num.to_i)
        end
      end
      array << hash
    end
    return array
  end
  
end
