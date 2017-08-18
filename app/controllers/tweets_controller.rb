class TweetsController < ApplicationController
  def index
      if logged_in? then 
          redirect_to :action => "main"
      else 
          @tweets = Tweet.find_by_sql(["SELECT * FROM tweets ORDER BY created_at DESC"])
      end
  end
      
  def main
      if !logged_in? then
          redirect_to :action => "index"
      else 
          @tweets = Tweet.find_by_sql(["SELECT * FROM tweets WHERE uid = ? OR uid IN (SELECT fid FROM follows WHERE uid = ? ) ORDER BY created_at DESC", current_user.id, current_user.id])
      end
  end
      
  def show
  end

  def new
  end
    
  def create
    if !logged_in? then
        flash[:danger] = "ログインしてください"
        redirect_to :action => "index"
        
    elsif params[:tweet][:rtid].to_i == TYPE_NOT_RETWEET
        if params[:tweet][:content] == "" then
            flash[:danger] = "ツイートを入力してください"
            redirect_to :action => "main"
        else
            @tweet = Tweet.new
            @tweet.uid = current_user.id
            @tweet.rtid = TYPE_NOT_RETWEET
            @tweet.content = params[:tweet][:content]
            @tweet.save
            flash[:success] = "ツイートしました！"
            redirect_to :action => "main"
        end
    else
        if Tweet.find_by(id: params[:tweet][:rtid].to_i).uid != current_user.id then
                t = Tweet.find_or_create_by(uid: current_user.id, rtid: params[:tweet][:rtid].to_i)
        end
        flash[:success] = "リツイートしました！" + params[:tweet][:rtid].to_s
        redirect_to :action => "main"
    end
  end
    
end
