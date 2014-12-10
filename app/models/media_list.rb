class MediaList < ActiveRecord::Base
  attr_accessible :journalist_ids, :name, :user_id

  belongs_to :journalist
  belongs_to :user

  has_many :journalists
end
