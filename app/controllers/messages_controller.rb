class MessagesController < ApplicationController
 before_action :set_group

 def index
   @message = Message.new
   @messages = @group.messages.includes(:user)
 end

 def create
   @message = @group.messages.new(message_params)
   
   if @message.save
     redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
   else
     @messages = @group.messages.includes(:user)
     flash.now[:alert] = 'メッセージを入力してください。'
     render :index
   end
 end

 private

 def message_params
   params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
 end

 def set_group
   @group = Group.find(params[:group_id])
 end
end
# ？？2/1 説明 private以下にset_groupを定義し、上記before_actionを利用して呼び出す
# ？？messagesコントローラの全てのアクションで@groupを利用できるようになる
# 2/1_L9-3問題4 メッセージ送信機能の実装時に上記記載