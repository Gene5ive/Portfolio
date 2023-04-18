class BlogsController < ApplicationController
  # Use before_action to set @blog instance variable for show, edit, update, and destroy actions
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
    # @blog instance variable already set by set_blog method
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice] = "Blog successfully added!"
    else
      flash[:notice] = "Errors"
      redirect_to new_blog_path
    end
    respond_to do |format|
      format.html { redirect_to blogs_path }
      format.js
    end
  end

  def edit
    # @blog instance variable already set by set_blog method
  end

  def update
    if @blog.update(blog_params)
      flash[:notice] = "Blog successfully edited!"
    else
      flash[:notice] = "Errors"
      redirect_to edit_blog_path
    end
    respond_to do |format|
      format.html { redirect_to blogs_path }
      format.js
    end
  end

  def destroy
    @blog.destroy
    flash[:notice] = "Blog successfully deleted!"
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
