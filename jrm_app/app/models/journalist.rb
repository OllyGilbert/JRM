class Journalist < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :title, :media_outlet

  has_many :media_lists
  has_many :users, through: :media_lists
  has_many :stories
  has_many :notes
end
