class StoriesController < ApplicationController
  expose(:stories){ Story.order('created_at DESC') }
  expose(:story)

  def index
    render
  end

end