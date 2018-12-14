jQuery(document).on 'turbolinks:load', ->
  mensagens_chats = $('#mensagens_chats')
  if $('#mensagens_chats').length > 0
    mensagens_chats_to_bottom = -> mensagens_chats.scrollTop(mensagens_chats.prop("scrollHeight"))

    mensagens_chats_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "SalasChatsChannel"
        sala_chat_id: mensagens_chats.data('sala-chat-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        mensagens_chats.append data['mensagem_chat']
        mensagens_chats_to_bottom()

      send_mensage: (mensagem_chat, sala_chat_id) ->
        @perform 'send_mensage', mensagem_chat: mensagem_chat, sala_chat_id: sala_chat_id


    $('#new_mensagem_chat').submit (e) ->
      $this = $(this)
      textarea = $this.find('#mensagem_texto')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_mensage textarea.val(), mensagens_chats.data('sala-chat-id')
        textarea.val('')
      e.preventDefault()
      return false