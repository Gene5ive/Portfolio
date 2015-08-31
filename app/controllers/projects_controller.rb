class ProjectsController < ApplicationController
  before_filter :authenticate_admin!, except: [:index, :show]

  def show
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.find(params[:id])
  end

  def new
    if current_user && current_user.admin?
      @skill = Skill.find(params[:skill_id])
      @project = @skill.projects.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new(project_params)
    if @project.save
      flash[:notice] = "Project successfully added!"
      redirect_to skill_path(@skill)
    else
      render :new
    end
  end

  def edit
    if current_user && current_user.admin?
      @skill = Skill.find(params[:skill_id])
      @project = @skill.projects.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project successfully updated!"
      redirect_to skill_path(@skill)
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.find(params[:id])
    @project.destroy
    flash[:notice] = "Project successfully deleted!"
    redirect_to skill_path(@skill)
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :project_link)
  end
end
