class Item < ActiveRecord::Base
  attr_accessible :description
  
  has_attached_file :manifest
  has_attached_file :payload

  belongs_to :package
end
