class Comment < ActiveRecord::Base
  attr_accessible :content, :story_id, :user_id

  belongs_to :user
  belongs_to :journalist
end
