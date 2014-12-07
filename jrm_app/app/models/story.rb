class Story < ActiveRecord::Base
  validates :headline, uniqueness: true

  attr_accessible :date_published, :headline, :journalist_id, :summary

  belongs_to :journalist
  belongs_to :publisher
  has_many :comments
  has_many :users, through: :comments

  acts_as_commentable
end
