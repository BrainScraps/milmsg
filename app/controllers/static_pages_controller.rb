class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      @message = current_user.messages.build
      #@feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def acknowledge
    @last_msg = Message.order('id').first


  end

  def signup
  	@user = User.new
  end

end
