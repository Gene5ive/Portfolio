class SkillsController < ApplicationController
  def show
    @skill = Skill.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @skill = @project.skills.new
  end

  def create
    @project = Project.find(params[:project_id])
    @skill = @project.skills.new(skill_params)
    if @skill.save
      redirect_to project_path(@skill.project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @skill = Skill.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @skill = Skill.find(params[:id])
    if @skill.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to projects_path
  end
  
  private
  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
