class MessagemBroadcastJob < ApplicationJob
  queue_as :default

  def perform(mensagem)
    ActionCable.server.broadcast "salas_chats_#{mensagem_chat.sala_chat.id}_channel",
                                 message: render_mensagem_chat(mensagem)
  end

  private

  def render_mensagem_chat(mensagem)
    MensagemChatController.render partial: 'mensagens_chat/mensagem', locals: {mensagem: mensagem}
  end
end