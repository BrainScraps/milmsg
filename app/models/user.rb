class User < ActiveRecord::Base
  attr_accessible :email, :name, :org_id, :phone, :position_id
end
