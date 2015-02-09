class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :tasks, through: :projects
  has_many :comments, through: :projects

  has_many :contributions, dependent: :destroy
  has_many :contributed_projects, through: :contributions, source: :projects

  has_many :watches, dependent: :destroy
  has_many :watched_projects, through: :watches, source: :project

  def has_watched?(project)
    watched_projects.include? project
  end

end
