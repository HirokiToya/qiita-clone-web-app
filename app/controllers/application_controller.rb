class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception 
  include SessionsHelper
  before_action :current_user
  
  
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
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
  			store_location
  			flash[:notice] = "ログインしてください"
  			redirect_to login_url
  		end
  	end
  	
end
