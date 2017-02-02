class WelcomeController < ApplicationController
  def index
  	@allarticles = Article.all.reverse_order
  	@articles = Article.all.reverse_order.paginate(:page => params[:page], :per_page => 1)
  	@allprojects = Project.all
  	@allresumes = Resume.all
  end
end
