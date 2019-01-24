jQuery(document).on 'turbolinks:load', ->
  mensagens = $('#mensagens')
  if $('#mensagens').length > 0
    mensagens_to_bottom = -> mensagens.scrollTop(mensagens.prop("scrollHeight"))

    mensagens_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "SalaChatChannel"
        sala_chat_id: mensagens.data('sala-chat-id')
      },


      connected: ->
      	alert(sala_chat_id)
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        mensagens.append data['mensagem']
        mensagens_to_bottom()


      send_mensagem: (mensagem, sala_chat_id) ->
        @perform 'send_mensagem', mensagem: mensagem, sala_chat_id: sala_chat_id



    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_message textarea.val(), messages.data('chat-room-id')
        textarea.val('')
      e.preventDefault()
      return false
    
  else
  	alert("erro")