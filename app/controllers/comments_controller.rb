class CommentsController < ApplicationController
  def show
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment successfully added!"
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment successfully updated!"
      redirect_to blog_path(@blog)
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment successfully deleted!"
    redirect_to blog_path(@blog)
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :description, :comment_link)
  end
end
