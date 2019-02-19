class DiscontentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @discontents = Discontent.where(naiyou: 1).order(created_at: :desc).page(params[:page]).limit(20)
  end

  def create
   
     if current_user.discontents.present? && (current_user.discontents.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).count>9 || current_user.discontents.last.created_at >= 10.seconds.ago)
        flash.now[:danger] = '不満投稿の制限に引っかかっています'
        @discontents = current_user.discontents.order('created_at DESC').page(params[:page])
        @discontent = current_user.discontents.build(discontent_params)
        return render "toppages/index"
     end
      
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
    params.require(:discontent).permit(:content, :title, :category_id,:naiyou, :payment)
  end
  
  def correct_user
    @discontent = current_user.discontents.find_by(id: params[:id])
    unless @discontent
      redirect_to root_url
    end
  end
  
 
  
  
end
