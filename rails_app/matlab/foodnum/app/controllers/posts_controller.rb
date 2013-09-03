class PostsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @post = Post.new 
    @post.author_id = current_user.id
    @post.wall_id = current_user.id
    
    @user = current_user

    @posts = Post.where(wall_id:@post.wall_id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
      format.js
    end
  end
  

  def create
  	if @post = Post.create(params[:post])
  	# success
  		@post.save
  		respond_to do |format|
	      format.html 
	      format.json { render json: @post, status: :created, location: @post }
	      format.js
	      format.any
	    end
  	else
  	  # error handling
  	end

  end

  def create_pic
    if @post = Post.create(params[:post])
    # success
      @post.save
      respond_to do |format|
        format.html 
        format.json { render json: @post, status: :created, location: @post }
        format.js { render json: @post, status: :created, location: @post }
        format.any
      end
    else
      # error handling
    end

  end

  def profilephoto
  	par = params[:user]
  	@user = current_user
  	#@user.avatar = Avatar.new(par)
  	@user.avatar = par[:avatar]
  	@user.save
	respond_to do |format|
	  format.html 
	  format.json {render :json => :create }
	  format.js
	  format.any
	end
  end

  def update
  	par = params[:user]
  	@user = current_user
  	#@user.avatar = Avatar.new(par)
  	@user.avatar = par[:avatar]
  	@user.save
  	respond_to do |format|
  	  format.html 
  	  format.json {render :json => :create }
  	  format.js
  	  format.any
  	end
  end

end