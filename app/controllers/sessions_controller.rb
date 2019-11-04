class SessionsController < ApplicationController
    before_action :require_login

  def new
  end

  def create
    session[:username] = params[:username]
    redirect_to '/'
  end

  def destroy
    session.delete :username
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  def current_user 
    @current_user = Session.find_by(username: session[:username])
  end 
end
