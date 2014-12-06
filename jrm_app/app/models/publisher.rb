class Publisher < ActiveRecord::Base
  attr_accessible :name

  has_many :stories
  has_many :positions
  has_many :journalists, through: :positions
  has_many :journalists
end
