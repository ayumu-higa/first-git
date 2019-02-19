class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  
  def counts(user)
    @count_discontents = user.discontents.count
    @count_likes = user.likes.count
    @count_current_user_discontents = 10 - current_user.discontents.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day).count
    @count_current_user_cash = current_user.discontents.where(naiyou: 1).where(payment: 0).count*10
    #現在のcashはpaymentが0のものだけにしている、貯める段階を楽しんでもらうという意味合いで、cash申請押したら現在のcashは0になる仕様、これは後々考える
  end
  
  
  
  
  
end
