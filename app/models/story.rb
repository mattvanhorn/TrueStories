class Story < ActiveRecord::Base
  attr_accessible :title, :body
  validates :body, :title, :presence => true
end