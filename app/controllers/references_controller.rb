class ReferencesController < ApplicationController
  before_filter :authenticate_admin!, except: [:index, :show]

  def index
    @references = Reference.all
  end

  def new
    if current_user && current_user.admin?
      @reference = Reference.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @reference = Reference.new(reference_params)
    if @reference.save
      flash[:notice] = "Reference successfully added!"
    else
      flash[:notice] = "Errors"
    end
    respond_to do |format|
      format.html { redirect_to references_path }
      format.js
    end
  end

  def edit
    if current_user && current_user.admin?
      @reference = Reference.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @reference = Reference.find(params[:id])
    if @reference.update(reference_params)
      flash[:notice] = "Reference successfully edited!"
    else
      flash[:notice] = "Errors"
    end
    respond_to do |format|
      format.html { redirect_to references_path }
      format.js
    end
  end

  def destroy
    @reference = Reference.find(params[:id])
    @reference.destroy
    flash[:notice] = "Reference successfully deleted!"
    redirect_to references_path
  end

  private
  def reference_params
    params.require(:reference).permit(:name, :company, :contact)
  end
end
