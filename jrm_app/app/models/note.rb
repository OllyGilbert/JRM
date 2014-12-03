class Note < ActiveRecord::Base
  attr_accessible :content, :journalist_id, :user_id

  belongs_to :user
  belongs_to :journalist
end
