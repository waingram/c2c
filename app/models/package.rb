class Package < ActiveRecord::Base
  attr_accessible :description, :title
  validates_presence_of :title, :on => :create, :message => "can't be blank"

  has_many :items
end
