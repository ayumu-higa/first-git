class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    discontent = Discontent.find(params[:discontent_id])
    current_user.followlike(discontent)
    flash[:success] = '不満を「わかる！！」しました。'
    redirect_to root_url
  end

  def destroy
    discontent = Discontent.find(params[:discontent_id])
    current_user.unfollowlike(discontent)
    flash[:success] = '不満を「わかる！！」を解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
