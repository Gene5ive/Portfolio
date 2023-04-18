class ReferencesController < ApplicationController
  before_action :set_reference, only: [:edit, :update, :destroy]

  def index
    @references = Reference.all
  end

  def new
    @reference = Reference.new
  end

  def create
    @reference = Reference.new(reference_params)
    if @reference.save
      flash[:notice] = "Added!"
    else
      flash[:alert] = "Reference couldn't be saved. Please check your input and try again."
    end
    respond_to do |format|
      format.html { redirect_to references_path }
      format.js
    end
  end

  def edit
  end

  def update
    if @reference.update(reference_params)
      flash[:notice] = "Saved!"
    else
      flash[:alert] = "Reference couldn't be saved. Please check your input and try again."
    end
    respond_to do |format|
      format.html { redirect_to references_path }
      format.js
    end
  end

  def destroy
    @reference.destroy
    flash[:notice] = "Reference deleted successfully!"
    redirect_to references_path
  end

  private

  def set_reference
    @reference = Reference.find(params[:id])
  end

  def reference_params
    params.require(:reference).permit(:name, :company, :contact)
  end
end
