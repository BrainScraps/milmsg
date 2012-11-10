class Organization < ActiveRecord::Base
  attr_accessible :name, :parent_id
end
