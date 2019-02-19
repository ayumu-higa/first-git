class ToppagesController < ApplicationController
  def index
    if logged_in?
      @discontent = current_user.discontents.build  # form_for 用
      @discontents = current_user.feed_discontents.order('created_at DESC').page(params[:page]).limit(10)
    end
  end
end
