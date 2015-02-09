class Comment < ActiveRecord::Base

belongs_to :user

belongs_to :project

  def user_email
    user.email if user
  end

  def user_name
    user.username if user
  end

end
