class User < ApplicationRecord
    has_secure_password
    has_many :shoppings
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, allow_blank: true
    validates :password_confirmation, presence: true, allow_blank: true
    scope :sort_user, -> { order(id: :ASC)}

    def user_history
			hash = {}
			hash[:id] = self.id
			hash[:name] = self.name
			hash[:email]= self.email
			hash[:create] = self.created_at
			hash[:admin] = self.admin

			array = []
			self.shoppings.all.each do |shopping|
				array << shoppings
			end
			hash[:orders] = array
			return hash
    end

end
