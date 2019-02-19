class CashController < ApplicationController
  def index
    @discontents = Discontent.where(payment: 1).where(naiyou: 1).order(created_at: :asc).page(params[:page])
  end
  
  def create
    
    
    @discontent = Discontent.find(params[:discontent_id])
   
    if params[:payment_id] == 'shinseityu'
      
      @discontent.payment = 1
      @discontent.save
       
      flash[:success] = 'cash申請中'
      redirect_back(fallback_location: root_path)
    elsif params[:payment_id] == 'kanryou'
    
       @discontent.payment = 2
       @discontent.save
       flash[:success] = 'cash支払い完了'
       redirect_back(fallback_location: root_path)
    end
    
  end
end
