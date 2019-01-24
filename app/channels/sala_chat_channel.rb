class SalaChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "sala_chat_#{params['sala_chat_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_mensagem(data)
    current_usuario.mensagens.create!(texto: data['mensagem'], sala_chat_id: data['sala_chat_id'])
  end
end
