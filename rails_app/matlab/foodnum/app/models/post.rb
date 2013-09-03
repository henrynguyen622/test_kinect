class Post < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :text
  mount_uploader :postphoto, PostPhoto

  def self.create(post_params)
  	p = Post.new
  	p.text = post_params["text"]
  	p.author_id = post_params["author_id"]
  	p.wall_id = post_params["wall_id"]
  	p.postphoto = post_params[:postphoto]
  	p.title = post_params["title"]
  	p.rating = post_params["rating"]
  	p.location = post_params["location"]
  	return p
  end


end
