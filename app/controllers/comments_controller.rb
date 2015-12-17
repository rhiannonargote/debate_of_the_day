class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    comment_details = comment_params
    comment_details[:user_id] = @current_user.id

    micropost = Micropost.find params[:micropost_id]

    comment_details[:micropost_id] = micropost.id
    @comment = Comment.new comment_details

    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to "/users/#{ micropost.user.id }/microposts/#{ micropost.id }"
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end