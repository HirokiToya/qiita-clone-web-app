class Stock < ApplicationRecord

	validates :user_id, {presence:true}
	validates :article_id, {presence:true}
end
