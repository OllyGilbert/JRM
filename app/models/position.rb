class Position < ActiveRecord::Base
  attr_accessible :journalist_id, :publisher_id, :title

  belongs_to :publisher
  belongs_to :journalist
end
