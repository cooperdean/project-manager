class Project < ActiveRecord::Base

  belongs_to :user
  has_many :tasks, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :contributions, dependent: :destroy
  has_many :contributors, through: :contributions, source: :user

  has_many :watches, dependent: :destroy
  has_many :watching_users, through: :watches, source: :user

  validates :view_count, numericality: {greater_than_or_equal_to: 0}

  extend FriendlyId
  friendly_id :title, use: :slugged

  def user_email
    user.email if user
  end

  def user_username
    user.username if user
  end

end
