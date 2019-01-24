class MensagemBroadcastJob < ApplicationJob
  queue_as :default

  def perform(mensagem)
    ActionCable.server.broadcast "chat_rooms_#{mensagem.chat_room.id}_channel",
                                 mensagem: render_mensagem(mensagem)
  end

  private

  def render_mensagem(mensagem)
    MensagensController.render partial: 'mensagens/mensagem', locals: {mensagem: mensagem}
  end
end
