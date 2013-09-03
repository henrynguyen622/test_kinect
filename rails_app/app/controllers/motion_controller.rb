
class MotionController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    m = Movies.find_by(lcid:1)
	respond_with(m.to_json)
    #respond_with(m.data)
  end
  
  def browse_session
    m = Task.all.only(:tid,rat)
	respond_with(m.to_json)
  end

  def push
  end
end
