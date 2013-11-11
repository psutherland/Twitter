class TweetsController < ApplicationController
  def index
  	@tweets = Tweet.order("id DESC")
  	@tweet = Tweet.new 
  end

  def create
  	@tweet = Tweet.new(params[:tweet]) #(:content => params[:tweet][:content])
  	if @tweet.save #if we pass validation
  		redirect_to :action => :index
  	else
  		@tweets = Tweet.order("id DESC")
  		render :action => :index
  	end
  end
end
