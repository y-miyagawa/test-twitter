class FollowsController < ApplicationController
  def index
  end

  def create
      if !logged_in? then
        flash[:danger] = "ログインしてください"
        redirect_to ("/login") 
          
      elsif params[:mode] == "many" then
        @data = params[:new_follower]
        params[:new_follower].each do |new_follower|
            if (new_follower["flag"] == ADD_FOLLOW_YES) && (current_user.id != new_follower["id"].to_i) then
                t = Follow.find_or_create_by(uid: current_user.id, fid: new_follower["id"].to_i)
            end
        end
        flash[:success] = "フォローしました！"
        redirect_to :controller => "tweets", :action => "main"
            
      else
        @data = params[:new_follower]
      end
  end
end
