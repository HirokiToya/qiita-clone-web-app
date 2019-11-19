class Article < ApplicationRecord
 
  acts_as_taggable
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true

  def user
    User.find_by(id: self.user_id)
  end

  scope :find_by_tag, ->tags {
  	if tags.present?
  		tagged_with(tags, any: true) 
  	end
  }
 
end
