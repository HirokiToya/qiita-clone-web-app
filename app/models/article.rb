class Article < ApplicationRecord

  acts_as_taggable             #acts_as_taggable_on :tags のエイリアス   
  #belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, {presence: true,length: {maximum: 140}}
  validates :content, {presence: true}
  

  

  def user
  	return User.find_by(id: self.user_id)
  end


end
