class Note < ActiveRecord::Base
  attr_accessible :content, :journalist_id, :user_id
end
