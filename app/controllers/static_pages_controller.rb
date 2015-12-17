
class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost_new  = current_user.microposts.build
      @micropost = current_user.microposts.last
      @comment = current_user.comments.build 
      @feed_items = current_user.feed.paginate(page: params[:page])      
    end
  end


  def help
  end

  def about
  end

  def contact
  end
end