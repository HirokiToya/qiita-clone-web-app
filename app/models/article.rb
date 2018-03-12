class Article < ApplicationRecord


  
  acts_as_taggable #acts_as_taggable_on :tags のエイリアス   
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, {presence: true,length: {maximum: 140}}
  validates :content, {presence: true}



  def user
    return User.find_by(id: self.user_id)
  end




  scope :find_by_tag, -> tags {
  	#タグが入力されている場合のみタグを条件に抽出
  	if tags.present?
  		tagged_with(tags, any: true) #タグ付けレコードの取得方法を指定
  	end
  }
 

  


end
