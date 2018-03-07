class UsersController < ApplicationController

  def index
  end

  def show
  	@user = User.find(params[:id])
    @articles = Article.where(user_id: @user.id)
  end


  def new
  	@user = User.new
  end


  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:notice] = "ユーザー登録が完了しました"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
 

  def edit
  	@user = User.find_by(id: params[:id])
  end


  def update
  	@user = User.find_by(id: params[:id])
  	@user.name = params[:name]
  	@user.email = params[:email]
  	@user.password = params[:password]
    @user.self_introduction = params[:self_introduction]

  	if @user.save
  		flash.now[:notice] = "ユーザー情報を編集しました"
  		redirect_to @user
  	else
  		render("users/edit")
  	end
  end


end


private

  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end
