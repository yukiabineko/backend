class User < ApplicationRecord
    has_secure_password
    has_many :shoppings, dependent: :destroy
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
	VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
	validates :tel, presence: true, uniqueness: true, format: { with: VALID_PHONE_NUMBER_REGEX }
    validates :password, presence: true, allow_blank: true
    validates :password_confirmation, presence: true, allow_blank: true
    scope :sort_user, -> { order(id: :ASC)}

    def user_history
		hash = {}
		hash[:id] = self.id
		hash[:name] = self.name
		hash[:email]= self.email
		hash[:tel] = self.tel.present
		hash[:create] = self.created_at
		hash[:admin] = self.admin

			array = []
			self.shoppings.all.shopping_sort.each do |shopping|
				array << shoppings
			end
			hash[:orders] = array
			return hash
	end

	def search_history(n)
		shoppings.order(shopping_date: :desc).limit(5).offset((n-1)*5)
	end

	##オーダー登録********************************#

	def user_shopping(param)
		if param[:time].present?
			time_array = param[:time].split(':')
			hour = time_array[0]
			min = time_array[1]
			
			time = Time.local(
			Time.new.year,
			Time.new.month,
			Time.new.day + 1,
			hour,
			min,0
			)
		end
	  record = self.shoppings.find_by(
		  name: param[:name], 
		  process: param[:process],
		  status: 0,
          receiving_time: time
		)
	#すでに同名、同加工法、同日時の場合は既存レコードに注文数追加そうでない場合新規作成
      if record
		total = record.num.to_i
		total += param[:num].to_i
		record.update_attributes(num: total)
	  else
		self.shoppings.create(
		name: param[:name],
        price: param[:price],
        
        num: param[:num],
        process: param[:process],
        shopping_date: (Date.today + 1).strftime('%Y/%m/%d'),
        receiving_time:  time
	  )
	  end
	end
	

end
