class StoriesController < ApplicationController
  expose(:newest_stories){ Story.newest.page(params[:page]) }
  expose(:popular_stories){ Story.popular.page(params[:page]) }
  expose(:story)

  respond_to :html

  def index
    respond_to do |format|
      format.js
      format.html
      format.xml  { render :xml => newest_stories }
    end
  end

  def popular
    respond_to do |format|
      format.js
      format.html
      format.xml  { render :xml => popular_stories }
    end
  end

  def new
    render
  end

  def create
    story.save
    respond_with story, :location => root_url
  end
end