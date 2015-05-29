class CommentsController < ApplicationController
  before_filter :load_wedding
  before_filter :ensure_logged_in, only: [:create, :destroy]

  def show
    @comment = Comment.find(params[:id])
    if current_user
      @comment = @wedding.comments.build
    end
  end

  def create
    @comment = @wedding.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to wedding_path(@wedding), notice: "Comment added successfully!"
    else
      render 'weddings/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to wedding_path(@comment.wedding)
  end


  private
  def comment_params
    params.require(:comment).permit(
      :id,
      :note,
      :wedding_id,
      :user_id,
      :_destroy)
  end

  def load_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
