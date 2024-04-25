class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # room_channel.rbとroom_channle.jsでデータの送受信ができるようになる
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # jsで実行されたspeakのmessageを受け取り、room_channelのreceivedにブロードキャスト
    ActionCable.server.broadcast 'room_channel', message: data['message']
  end
end
