class SessionsController < ApplicationController
  def new
  end
    
    def create
        if logged_in? then
            flash[:danger] = "すでにログインしています"
            redirect_to("/tweets")
        end
            
        user = User.find_by(username: params[:session][:username].downcase)
        if user && user.authenticate(params[:session][:password])
            log_in user
            redirect_to ("/tweets")
        else
            flash.now[:danger] = "usernameかpasswordが間違っています"
            render "new"
        end
    end
    
    def destroy
        log_out
        redirect_to ("/tweets/index")
    end
    
end
