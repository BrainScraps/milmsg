class Message < ActiveRecord::Base
  attr_accessible :author_id, :target_json, :timestamp
end
