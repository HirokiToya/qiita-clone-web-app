class ArticlesController < ApplicationController
	
	before_action :authenticate_user
  	before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  	

	def index
		@articles = Article.all.order(created_at: :desc)
	end

	def show
		@article = Article.find_by(id: params[:id])
		@user = @article.user

	end

	def new
		@article = Article.new
	end

	def create
		
		@article = Article.new(title: params[:title],
							   content: params[:content],
							   user_id: current_user.id)
		
		if @article.save
			flash[:notice] = "投稿を作成しました"
			redirect_to ("/articles/index")

		else
			flash[:notice] = "投稿できませんでした"
			render("articles/new")
		end

	end

	def edit
		@article = Article.find_by(id: params[:id])
	end

	def update
		@article = Article.find_by(id: params[:id])
		@article.title = params[:title]
		@article.content = params[:content]
		if @article.save
			flash[:notice] = "投稿を編集しました"
			redirect_to("/articles/index")
		else
			render("articles/edit")
		end
	end


	def destroy
		@article = Article.find_by(id: params[:id])
		@article.destroy
		flash[:notice] = "投稿を削除しました"
		redirect_to("/articles/index")
	end

	def ensure_correct_user
    	@article = Article.find_by(id: params[:id])
    	if @article.user_id != @current_user.id
      		flash[:notice] = "権限がありません"
      		redirect_to("/posts/index")
    	end
  	end

	

end
