class Story < ActiveRecord::Base
  validates :headline, uniqueness: true

  attr_accessible :date_published, :headline, :journalist_id, :summary

  belongs_to :journalist
  has_many :comments
  has_many :users, through: :comments
end
