class TweetsController < ApplicationController
  def index
      if logged_in? then 
          redirect_to :action => "main"
      else 
          @tweets = Tweet.all
      end
  end
      
  def main
      @tweets = Tweet.all
  end
      
  def show
  end

  def new
  end
    
  def create
    if logged_in? then
        @tweet = Tweet.new
        @tweet.uid = current_user.id
        @tweet.rtid = "0"
        @tweet.content = params[:tweet][:content]
        @tweet.save
        flash[:success] = "ツイートしました！"
        redirect_to :action => "main"
    else
        flash[:danger] = "ログインしてください"
        redirect_to :action => "index"
    end
  end
    
end
