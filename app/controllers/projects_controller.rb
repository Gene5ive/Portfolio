class ProjectsController < ApplicationController
  def show
    # Find the skill associated with the project
    @skill = Skill.find(params[:skill_id])
    # Find the project by its ID within the skill
    @project = @skill.projects.find(params[:id])
  end

  def new
    # Find the skill associated with the project
    @skill = Skill.find(params[:skill_id])
    # Create a new project within the skill
    @project = @skill.projects.new
  end

  def create
    # Find the skill associated with the project
    @skill = Skill.find(params[:skill_id])
    # Create a new project with the parameters from the form
    @project = @skill.projects.new(project_params)
    if @project.save
      flash[:notice] = "Project successfully added!"
      # Redirect to the skill show page on successful save
      redirect_to skill_path(@skill)
    else
      # Render the new project form on failure to save
      render :new
    end
  end

  def edit
    # Find the skill associated with the project
    @skill = Skill.find(params[:skill_id])
  end

  def update
    # Find the skill associated with the project
    @skill = Skill.find(params[:skill_id])
    # Find the project by its ID within the skill
    @project = @skill.projects.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project successfully updated!"
      # Redirect to the skill show page on successful update
      redirect_to skill_path(@skill)
    else
      # Render the edit project form on failure to update
      render :edit
    end
  end

  def destroy
    # Find the skill associated with the project
    @skill = Skill.find(params[:skill_id])
    # Find the project by its ID within the skill
    @project = @skill.projects.find(params[:id])
    # Destroy the project
    @project.destroy
    flash[:notice] = "Project successfully deleted!"
    # Redirect to the skill show page after deleting project
    redirect_to skill_path(@skill)
  end

  private
  def project_params
    # Whitelist the permitted parameters for project creation and update
    params.require(:project).permit(:name, :description, :project_link)
  end
end
