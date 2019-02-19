class UsersinnseisController < ApplicationController
  before_action :admin_user
  def index
    
    @discontents_count = Discontent.where(naiyou: 1).where(payment: 1).group(:user_id).count
    
    @users = User.where(id: @discontents_count.keys).page(params[:page])
  end

  def create
    @user = User.find(params[:user_id])
    #上で定義している@userを下のif文の中に入れている。上のuserの定義は必要
    if Discontent.where(payment: 1).where(naiyou: 1).where(user_id: @user).update_all(payment: 2)
      redirect_back(fallback_location: root_url)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def admin_user
    unless current_user.admin?
     redirect_to root_url
    end
  end
  
end
