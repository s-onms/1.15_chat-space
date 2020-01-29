class GroupsController < ApplicationController

 def index
 end
 # 1/29_サイドバーにグループ一覧を表示
 # 今回はインスタンス変数の設定が不要なため、アクションの中身は不要

 def new
   @group = Group.new
   @group.users << current_user
 end
 # 1/29_groupsコントローラーにアクションを追加
 # 1/29_新規登録の時に必要な、↑「new」の定義

 def create
  @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
    # 1/29_新規登録の時に必要な、↑「create」の定義

 end

 def edit
  @group = Group.find(params[:id])
 end

 def update
  @group = Group.find(params[:id])
  if @group.update(group_params)
    redirect_to root_path, notice: 'グループを更新しました'
  else
    render :edit
  end
 end

 private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
  # 1/29_配列の保存を許可するためのストロングパラメータが必要
  # 配列に保存を許可したい場合、キーの名称と関連づけてバリューに[]と記述
end

