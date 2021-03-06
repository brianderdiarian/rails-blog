class ProjectsController < ApplicationController

  http_basic_authenticate_with name: ENV['NAME'], password: ENV['PASSWORD'], except: [:index, :show]

  def index
    @projects = Project.all
  end

  def show
  	@project = Project.find(params[:id])
    @allprojects = Project.all
    @allarticles = Article.all.reverse_order
    @articles = Article.all
    @allresumes = Resume.all
  end

  def new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
  	@project = Project.new(project_params)

  	@project.save
  	redirect_to @project
  end

  def update
    @project = Project.find(params[:id])
 
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
 
    redirect_to projects_path
  end

  private
  	def project_params
  	  params.require(:project).permit(:title, :text)
	  end
end
