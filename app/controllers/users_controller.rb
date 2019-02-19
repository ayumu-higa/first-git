class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit]
  before_action :admin_user, only:[:index, :show]
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @discontents = @user.discontents.order('created_at DESC').page(params[:page])
    counts(@user)
    
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       flash[:success] = 'ユーザーを登録しました'
       redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
    
      
    
  end
  
  
  
  def edit
    @user = User.find(params[:id])
    # そのUserの持つnaiyouが1かつpaymentが0のもの whereはandのような意味もある
    @discontents_count = Discontent.where(user_id: current_user.id).where(naiyou: 1).where(payment: 0).count
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
       flash[:success] = '口座情報を登録しました'
       redirect_to @user
    else
      flash.now[:danger] = '口座情報は登録できませんでした'
      render :edit
    end
  end
  
  
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.followlikeings.page(params[:page])
    counts(@user)
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :bankaccount, :bankaccount_name, :bankaccount_kananame, :kinyuu_name, :siten_name)
  end
  
  def admin_user
    unless current_user.admin?
     redirect_to root_url
    end
  end
  
end
