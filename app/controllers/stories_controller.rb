class StoriesController < ApplicationController
  expose(:newest_stories){ Story.newest }
  expose(:popular_stories){ Story.popular }
  expose(:story)

  respond_to :html

  def index
    render
  end

  def popular
    render
  end

  def new
    render
  end

  def create
    story.save
    respond_with story, :location => root_url
  end
end