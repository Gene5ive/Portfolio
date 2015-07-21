class ReferencesController < ApplicationController
  def index
    @references = Reference.all
  end

  def new
    @reference = Reference.new
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
    @reference = Reference.find(params[:id])
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
