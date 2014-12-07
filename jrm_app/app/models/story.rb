class Story < ActiveRecord::Base
  validates :headline, uniqueness: true

  attr_accessible :date_published, :headline, :journalist_id, :summary

  belongs_to :journalist
  belongs_to :publisher
  # has_many :comments
  # has_many :users, through: :comments

  has_many :comments, as: :commentable
end
