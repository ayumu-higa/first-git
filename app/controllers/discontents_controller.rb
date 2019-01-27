class DiscontentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  def index
    @discontents = Discontent.order(created_at: :desc).page(params[:page])
  end

  def create
    @discontent = current_user.discontents.build(discontent_params)
    if @discontent.save
      flash[:success] = '不満を投稿しました。'
      redirect_to root_url
    else
      @discontents = current_user.feed_discontents.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '不満の投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @discontent.destroy
     flash[:success] = '不満を削除しました。'
     redirect_back(fallback_location: root_path)
  end
  
   private

  def discontent_params
    params.require(:discontent).permit(:content, :title)
  end
  
  def correct_user
    @discontent = current_user.discontents.find_by(id: params[:id])
    unless @discontent
      redirect_to root_url
    end
  end
  
end
