class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception 
  include SessionsHelper
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインしてください"
      redirect_to("/login")
    end
  end
  
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts/index")
    end
  end

  private

  	#ユーザーのログインを確認する
  	def logged_in_user
  		unless logged_in?
  			flash[:notice] = "ログインしてください"
  			redirect_to login_url
  		end
  	end
  	
end
