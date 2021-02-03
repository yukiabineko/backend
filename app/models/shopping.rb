class Shopping < ApplicationRecord
  belongs_to :user


  def self.sale_data(params)
    first_day = params.present? ?Date.parse(params).beginning_of_month : Date.today.beginning_of_month
    lase_day = first_day.end_of_month
    where(status: 2).where(shopping_date: first_day .. lase_day).order(shopping_date: :ASC)
  end
  
end
