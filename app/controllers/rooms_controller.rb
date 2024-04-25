class RoomsController < ApplicationController
  before_action :authenticate_user!   # Deviseのログイン確認

  def show
    # メッセージ一覧を取得
    @chats = Chat.all
  end
end
