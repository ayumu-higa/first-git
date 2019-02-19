class KakuninnsController < ApplicationController
  before_action :admin_user
  def index
    # 内容確認ページ
    # naiyouが0であるものを、作成日の昇順でDiscontentインスタンスを作成
    @discontents = Discontent.where(naiyou: 0).order(created_at: :asc).page(params[:page])
  end

  def create
    # 内容確認ページで、YESかNOを選択したときにとぶところ
    # params[:discontents_id]にはnaiyouを変更したいdiscontentの主キーが入っている
    # 要復習find(主キー)の使い方
    @discontent = Discontent.find(params[:discontent_id])
    #kakuninns.html.erbでlink_toで１つ１つ受け取れるようにしているからストロングパラメーターにはかかなくていい
    if params[:naiyou_id] == 'yes'
    
      #もビュー側で１つ１つなのでストロングパラメーターには書かなくていい
      # 前の画面でnaiyou_idという名前のパラメーターを送っている
      # その中身がyesであるので、ここを実行している
      @discontent.naiyou = 1
      @discontent.save
       
      flash[:success] = '確認済み投稿成功'
      redirect_back(fallback_location: root_path)
    elsif params[:naiyou_id] == 'no'
       @discontent.naiyou = 2
       @discontent.save
       flash.now[:danger] = '投稿制限にかかりました'
       redirect_back(fallback_location: root_path)
    end
      
         
    
  end
  
   private

  def discontent_params
    params.require(:discontent).permit(:content, :title, :category_id,:naiyou)
  end
  
  def admin_user
    unless current_user.admin?
     redirect_to root_url
    end
  end
  
  
  
end
