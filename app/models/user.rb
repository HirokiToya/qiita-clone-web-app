class User < ApplicationRecord
	validates :name,{presence: true}
	validates :email,{presence: true, uniqueness: true}
	has_secure_password
	validates :password,presence: true, length:{minimum: 6}
	#has_many :articles,dependent: :destroy
	

	def articles
		return Article.where(user_id: self.id)
	end
	


end
