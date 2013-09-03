
class SessionController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    #m = Task.all.only(:tid,:rat)
	  m = Sequence.only(:tid,:rat).all
    respond_with(m.to_json)
  end
  
  def browse
    task_id = params[:tid]
    #m = Task.where(tid:task_id).only(:tid, :tra, :den, :num)
    m = Sequence.where(tid:task_id).only(:tid, :tra, :den, :num, :step)
	  respond_with(m.to_json)
  end

  def find
    patient_id = params[:pid]
    patient_state = params[:pstate]
    patient_task = params[:ptype]
    #m = Task.where(tid:task_id).only(:tid, :tra, :den, :num)
    m = Sequence.only(:tid,:rat).where({pid:patient_id,sta:patient_state,tin:patient_task})
    respond_with(m.to_json)
  end
end
