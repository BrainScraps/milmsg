class Message < ActiveRecord::Base
  attr_accessible  :target_json, :timestamp, :content
  belongs_to :user

  default_scope order: 'messages.created_at DESC'
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
