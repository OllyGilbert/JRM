class Story < ActiveRecord::Base
  attr_accessible :date_published, :headline, :journalist_id, :summary
end
