class UsersController < ApplicationController
  # 2/5 インクリメンタルサーチで追記後、再度追記
  # 検索処理の内容は、whereメソッドを使用。入力された値を含むかつ、ログインしているユーザーのidは除外する条件で取得
  def index
    return nil if params[:keyword] == ""
    @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end

  # 1/28 下記全部追記
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
  end
