class SalasChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "salas_chats_#{params['sala_chat_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_usuario.mensagens_chat.create!(texto: data['mensagem_chat'], sala_chat_id: data['sala_chat_id'])
  end
end
