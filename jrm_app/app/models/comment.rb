class Comment < ActiveRecord::Base
  attr_accessible :content, :story_id, :user_id
end
