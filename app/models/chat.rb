class Chat < ApplicationRecord
    belongs_to :user


    validates :sentence, presence: true
    # データ保存後にChatBroadcastJobのperformメソッドを実行、引数はself
    after_create_commit { ChatBroadcastJob.perform_later self }
end
  