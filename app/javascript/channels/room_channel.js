import consumer from "channels/consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  // room_channel.rbでブロードキャストされたデータがreceivedに届き、アラート表示を実行
  // アラート表示する内容は「data(['message'])
  // 「even.target.value」で取得したデータと同じ
  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    return $('#chats').append(data['chat']);
  },

  
  // 仮引数 function(message)のmessage
  // 実引数 event.target.value
  // room_channel.rbのspeakアクションを動かすために、speak関数を定義
  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});


  // フォーム内でEnterキーが押された時の動作を記述
  // event.KeyCode === 13は非推奨となっているため、event.key === 'Enter'と変更
  $(document).on('Keypress', '[data-behavior~=room_speaker]', function(event) {
    if (event.key === 'Enter') {
      chatCannel.speak(event.target.value);
      event.target.value = '';
      event.preventDefault();
    }
  })
