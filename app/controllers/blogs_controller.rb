class BlogsController < ApplicationController
  before_filter :authenticate_admin!, except: [:index, :show]

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    if current_user && current_user.admin?
      @blog = Blog.new
    else
      redirect_to new_user_session_path
    end
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
    if current_user && current_user.admin?
      @blog = Blog.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @blog = Blog.find(params[:id])
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
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:notice] = "Blog successfully deleted!"
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
