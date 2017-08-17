# coding: utf-8

class UsersController < ApplicationController
  def index
      
  end

  def show
      @user = User.find(params[:uid])
      @followers = User.find_by_sql(["SELECT users.id AS id, name, t.created_at FROM users JOIN (SELECT fid, created_at FROM follows where uid = ?) AS t ON users.id = fid", @user.id])
      
  end
    
end

