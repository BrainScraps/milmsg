class Confirmation < ActiveRecord::Base
  attr_accessible :confirmed, :message_id, :responder_id, :timestamp
end
