class SkillsController < ApplicationController
  before_filter :authenticate_admin!, except: [:index, :show]

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def new
    if current_user && current_user.admin?
      @skill = Skill.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      flash[:notice] = "Skill successfully added!"
    else
      flash[:notice] = "Errors"
      redirect_to new_skill_path
    end
    respond_to do |format|
      format.html { redirect_to skills_path }
      format.js
    end
  end

  def edit
    if current_user && current_user.admin?
      @skill = Skill.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      flash[:notice] = "Skill successfully edited!"
    else
      flash[:notice] = "Errors"
      redirect_to edit_skill_path
    end
    respond_to do |format|
      format.html { redirect_to skills_path }
      format.js
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    flash[:notice] = "Skill successfully deleted!"
    redirect_to skills_path
  end

  private
  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end
