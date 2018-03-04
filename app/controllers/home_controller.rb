class HomeController < ApplicationController

  def top
  	if logged_in?
      @article  = current_user.articles.build
      
    end
  end

end
