class Item < ActiveRecord::Base
  attr_accessible :description
  
  has_attached_file :file
end
