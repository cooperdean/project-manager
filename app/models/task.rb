class Task < ActiveRecord::Base

belongs_to :project
belongs_to :user

  def user_email
    user.email if user
  end

  def user_username
    user.username if user
  end

end
