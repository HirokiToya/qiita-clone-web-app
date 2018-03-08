class StocksController < ApplicationController
	before_action :authenticate_user

	def create
		@stock = Stock.new(
			user_id: @current_user.id,
			article_id: params[:article_id]
		)

		@stock.save
		redirect_to("/articles/#{params[:article_id]}")
	end

	def destroy
		@stock = Stock.find_by(
			user_id: @current_user.id,
			article_id: params[:article_id]
		)

		@stock.destroy
		redirect_to("/articles/#{params[:article_id]}")
	end

end