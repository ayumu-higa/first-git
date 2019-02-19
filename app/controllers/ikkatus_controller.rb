class IkkatusController < ApplicationController
  before_action :admin_user
  
  def index
    @discontents = Discontent.where(payment: 0).where(naiyou: 1).order(created_at: :asc).page(params[:page])
  end
  
  def create
    # Userがキャッシュ申請を押したら、
    # そのUserの持つnaiyouが1かつpaymentが0のものを、全て1にするaction  update_allで保存までしている
    if Discontent.where(payment: 0).where(naiyou: 1).where(user_id: current_user.id).update_all(payment: 1)
      redirect_back(fallback_location: root_url)
      flash[:success] = 'cash申請しました！cash入金までしばらくお待ちください'
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  
  private
  
  def admin_user
    unless current_user.admin?
     redirect_to root_url
    end
  end
end
