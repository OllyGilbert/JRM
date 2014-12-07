class Journalist < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :title, :media_outlet, :twitter

  has_many :media_lists
  has_many :users, through: :media_lists

  has_many :stories
  has_many :positions
  has_many :publishers, through: :positions
  has_many :publishers
  has_many :notes

end
