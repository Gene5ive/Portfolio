class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    if @recommendation.save
      flash[:notice] = "Recommendation successfully added!"
    else
      flash[:notice] = "Errors"
    end
    respond_to do |format|
      format.html { redirect_to recommendations_path }
      format.js
    end
  end

  def edit
    @recommendation = Recommendation.find(params[:id])
  end

  def update
    @recommendation = Recommendation.find(params[:id])
    if @recommendation.update(recommendation_params)
      flash[:notice] = "Recommendation successfully edited!"
    else
      flash[:notice] = "Errors"
    end
    respond_to do |format|
      format.html { redirect_to recommendations_path }
      format.js
    end
  end

  def destroy
    if current_user && current_user.admin?
      @recommendation = Recommendation.find(params[:id])
      @recommendation.destroy
      flash[:notice] = "Recommendation successfully deleted!"
    else
      redirect_to new_user_session_path
    end
    redirect_to recommendations_path
  end

  private
  def recommendation_params
    params.require(:recommendation).permit(:body, :name, :company)
  end
end
