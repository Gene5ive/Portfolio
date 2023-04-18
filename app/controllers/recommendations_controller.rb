class RecommendationsController < ApplicationController
  # Use before_action to avoid repeating code for finding a recommendation
  before_action :find_recommendation, only: [:show, :edit, :update, :destroy]

  def index
    @recommendations = Recommendation.all
  end

  def show
    # Use the instance variable set by before_action
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
    # Use the instance variable set by before_action
  end

  def update
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

  def find_recommendation
    @recommendation = Recommendation.find(params[:id])
  end
end
