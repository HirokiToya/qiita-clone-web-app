class ArticlesController < ApplicationController
	protect_from_forgery except: :create # createアクションを除外
	before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  	
	def index
		@q = Article.ransack(params[:q])
		@articles = @q.result(distinct: true).includes(:taggings).paginate(page: params[:page])

	end

	def tag_index

		if params[:tag]
			@articles = Article.tagged_with(params[:tag])
		else
			@articles = Article.all
		end

		@type = params[:tag]
		@tag_articles = @articles.includes(:taggings).page(params[:page]).order("id DESC").paginate(page: params[:page])
	end

	def show
		@article = Article.find_by(id: params[:id])
	end

	def new
		@article = Article.new	
	end

	def create
		@article = Article.new
		@article.title = params[:title]
		@article.content = params[:content]
		@article.user_id = @current_user.id
		@article.tag_list = params[:tag_list]
		
		if @article.save
			flash[:notice] = "投稿を作成しました"
			redirect_to ("/articles/index")
		else 
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
		@article.tag_list = params[:tag_list]
		
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
