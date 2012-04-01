class StoriesController < ApplicationController
  expose(:stories){ Story.order('created_at DESC') }
  expose(:story)

  respond_to :html

  def index
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