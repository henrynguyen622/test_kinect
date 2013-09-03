class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
  	#this is for the post form
  	@post = Post.new 
  	@post.author_id = current_user.id
  	@post.wall_id = current_user.id
  	
  	@user = current_user

  	@posts = Post.where(wall_id:@post.wall_id)
  end

end
