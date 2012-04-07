class Story < ActiveRecord::Base
  attr_accessible :title, :body, :link

  validates :body, :title, :presence => true

  make_voteable

  scope :popular, order('(up_votes - down_votes) DESC, created_at DESC')
  scope :newest,  order('created_at DESC')
end