class SkillsController < ApplicationController
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

  private
  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
