class TweetsController < ApplicationController
  def index
      if logged_in? then 
          redirect_to("") 
      else 
          @tweets = Tweet.all
      end
  end

  def show
  end

  def new
  end
    
  def create
        @tweet = Tweet.new
        @tweet.uid = "1"
        @tweet.rtid = "0"
        @tweet.content = params[:tweet][:content]
        @tweet.save
        redirect_to "/tweets/index"
  end
    
end
