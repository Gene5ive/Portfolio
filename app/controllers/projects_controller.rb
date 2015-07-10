class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  def new
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new
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
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.find(params[:id])
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
    params.require(:project).permit(:name, :description)
  end
end
