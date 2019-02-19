class CategoriesController < ApplicationController
  before_action :admin_user
  
  def index
    
    @categories = Category.all
    @discontents = Discontent.order(created_at: :desc).page(params[:page])
  end
  
  
  
  
  def show
    @category = Category.find(params[:id])
    @discontents = @category.discontents.order(created_at: :desc).page(params[:page])
  end
  
  
  private
  
  def admin_user
    unless current_user.admin?
     redirect_to root_url
    end
    
    
  end

  
end
