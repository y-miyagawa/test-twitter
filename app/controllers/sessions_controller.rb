class SessionsController < ApplicationController
    def new
        if logged_in? then
            flash[:danger] = "すでにログインしています"
            redirect_to :controller =>"tweets", :action =>"main"    
        end
    end
    
    def create
        if logged_in? then
            flash[:danger] = "すでにログインしています"
            redirect_to :controller =>"tweets", :action =>"main"
        end
            
        user = User.find_by(username: params[:session][:username].downcase)
        if user && user.authenticate(params[:session][:password])
            log_in user
            redirect_to :controller => "tweets", :action => "main"
        else
            flash.now[:danger] = "usernameかpasswordが間違っています"
            render "new"
        end
    end
    
    def destroy
        log_out
        redirect_to ("/tweets")
    end
    
end
