class User < ApplicationRecord
	
	validates :name,presence: true, length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,presence: true,length:{ maximum:255 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
	before_save { self.email = email.downcase }

  validates :self_introduction, length: { maximum:200 }
	
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	has_many :articles,dependent: :destroy

	

	def articles
		return Article.where(user_id: self.id)
	end

	# 渡された文字列のハッシュ値を返す ficture向けのdigestメソッド
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
	


end
