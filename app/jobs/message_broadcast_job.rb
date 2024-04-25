class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end

  # ブロードキャスト（一つのネットワークの中にある全てのホストに対してデータを送る）
  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  # app/views/message/_message.html.erbを呼びだす
  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
