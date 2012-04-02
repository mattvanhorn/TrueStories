class VotesController < ApplicationController
  expose(:story){ Story.find_by_id(params[:story_id]) }

  respond_to :js

  def upvote
    current_user.up_vote!(story)
    render :vote
  end

  def downvote
    current_user.down_vote!(story)
    render :vote
  end
end