class ResumesController < ApplicationController

  http_basic_authenticate_with name: ENV['NAME'], password: ENV['PASSWORD'], except: [:index, :show]

  def index
    @resumes = Resume.all
  end

  def show
  	@resume = Resume.find(params[:id])
    @allprojects = Project.all
    @allarticles = Article.all.reverse_order
    @allresumes = Resume.all
    @articles = Article.all
  end

  def new
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def create
  	@resume = Resume.new(resume_params)

  	@resume.save
  	redirect_to @resume
  end

  def update
    @resume = Resume.find(params[:id])
 
    if @resume.update(resume_params)
      redirect_to @resume
    else
      render 'edit'
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
 
    redirect_to resumes_path
  end

  private
  	def resume_params
  	  params.require(:resume).permit(:body)
	  end
end
