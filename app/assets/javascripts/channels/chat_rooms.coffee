App.chat_rooms = App.cable.subscriptions.create "ChatRoomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

  send_message: ->
    @perform 'send_message'
