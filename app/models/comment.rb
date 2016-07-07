class Comment < ActiveRecord::Base
  belongs_to :recipe, :counter_cache => true
  belongs_to :user
  
  validates :content, :presence => true

end