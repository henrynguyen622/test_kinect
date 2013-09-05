class UsersController < ApplicationController
	 before_filter :authenticate_user!


  def update
  	par = params[:user]
  	@user = current_user
  	#@user.avatar = Avatar.new(par)
  	@user.name = par[:name]
  	@user.save
	redirect_to(edit_user_registration_path)
  end


  def profilephoto
  	par = params[:user]
  	@user = current_user
  	#@user.avatar = Avatar.new(par)
  	@user.avatar = par[:avatar]
  	@user.save
  	redirect_to(edit_user_registration_path)
  end

end