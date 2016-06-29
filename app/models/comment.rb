class Comment < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  
  validates :content, :presence => true
  accepts_nested_attributes_for :user, reject_if: :all_blank

  #def user_attributes=(user_params)
   # my_user = User.find_or_create_by(user_params)
    #self.user = my_user
  #end

end