class UsersController < ApplicationController

  before_action :logged_in_user, {only:[:edit, :update]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def index
    @users = User.find_by(id: 101)
    render json: @users
  end

  def show
  	@user = User.find(params[:id])
    @articles = Article.where(user_id: @user.id).includes(:taggings).paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(new_user_params)
  	if @user.save
      log_in @user
  		flash[:notice] = "ユーザー登録が完了しました"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
 
  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		flash[:notice] = "ユーザー情報を編集しました"
  		redirect_to @user
  	else
  		render("users/edit")
  	end
  end

  def stocks
    @user = User.find_by(id: params[:id])
    @stocks = Stock.where(user_id: @user.id).reverse_order.paginate(page: params[:page])
  end

  private

    def new_user_params
  	 params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end

    def user_params
      params.require(:user).permit(:name, :email, :self_introduction, :password, :password_confirmation)
    end

    #beforeアクション

    def ensure_correct_user
      if @current_user.id != params[:id].to_i
        flash[:notice] = "権限がありません"
        redirect_to("/")
      end
    end
    
end
