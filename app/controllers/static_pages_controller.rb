class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def signup
  	@user = User.new
  end

end
