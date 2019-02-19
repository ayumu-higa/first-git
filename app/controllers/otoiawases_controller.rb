class OtoiawasesController < ApplicationController
  before_action :admin_user, only:[:hensins]
  def index
    @otoiawases = Otoiawase.where(hensin: false).order(created_at: :asc).page(params[:page])
  end
  
  def new
    @otoiawase = Otoiawase.new
  end
  
  def create
     
     @otoiawase = current_user.otoiawases.build(otoiawase_params)
    
    
     
      if @otoiawase.save
       
         flash[:success] = 'お問い合わせ送信しました。返信までしばらくお待ちください。'
      
         redirect_back(fallback_location: root_path)
      else
        flash.now[:danger] = '送信できませんでした'
        render 'otoiawases/new'
      end
      
    
  end
  
  def hensins
    @otoiawase = Otoiawase.find(params[:id])
    
     if params[:hensin_id] == 'true'
      @otoiawase.hensin = "true"
      @otoiawase.save
       
      flash[:success] = 'お問い合わせに返信しました'
      redirect_back(fallback_location: root_path)
     end
  end
  
  
  private

  def otoiawase_params
    params.require(:otoiawase).permit(:content, :otoiawase_id, :hensin_id,)
  end
  
  
  def admin_user
    unless current_user.admin?
     redirect_to root_url
    end
  end
  
  
  
end
