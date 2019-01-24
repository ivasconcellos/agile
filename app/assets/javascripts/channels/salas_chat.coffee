jQuery(document).on 'turbolinks:load', ->
  mensagens = $('#mensagens')
  if $('#mensagens').length > 0
    mensagens_to_bottom = -> mensagens.scrollTop(mensagens.prop("scrollHeight"))

    mensagens_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "SalasChatChannel"
        sala_chat_id: mensagens.data('sala-chat-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        mensagens.append data['mensagem']
        mensagens_to_bottom()

      send_mensagem: (mensagem, sala_chat_id) ->
        @perform 'send_mensagem', mensagem: mensagem, sala_chat_id: sala_chat_id


    $('#new_mensagem').submit (e) ->
      $this = $(this)
      textarea = $this.find('#mensagem_texto')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_mensagem textarea.val(), mensagens.data('sala-chat-id')
        textarea.val('')
      e.preventDefault()
      return false