class MediaList < ActiveRecord::Base
  attr_accessible :journalist_ids, :name, :user_id
end
