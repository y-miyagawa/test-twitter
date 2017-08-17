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
    if logged_in? == false then
        flash[:danger] = "ログインしてください"
        redirect_to :action => "index"    
    elsif params[:tweet][:content] == "" then
        flash[:danger] = "ツイートを入力してください"
        redirect_to :action => "main"
    else
        @tweet = Tweet.new
        @tweet.uid = current_user.id
        @tweet.rtid = "0"
        @tweet.content = params[:tweet][:content]
        @tweet.save
        flash[:success] = "ツイートしました！"
        redirect_to :action => "main"
    end
  end
    
end
