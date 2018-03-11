class User < ApplicationRecord
	before_save { self.email = email.downcase }
	validates :name,{presence: true}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
	has_many :articles,dependent: :destroy
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	

	def articles
		return Article.where(user_id: self.id)
	end
	


end
