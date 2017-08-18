class FollowsController < ApplicationController
  def index
  end

  def create
      if !logged_in? then
        flash[:danger] = "ログインしてください"
        redirect_to ("/login") 
          
      elsif params[:mode] == "many" then
        @data = params[:newfol]
        params[:newfol].each do |newfol|
            if (newfol["flag"] == ADD_FOLLOW_YES) && (current_user.id != newfol["id"].to_i) then
                t = Follow.find_or_create_by(uid: current_user.id, fid: newfol["id"].to_i)
            end
        end
        flash[:success] = "フォローしました！"
        redirect_to :controller => "tweets", :action => "main"
            
      else
        @data = params[:newfol]
      end
  end
end
