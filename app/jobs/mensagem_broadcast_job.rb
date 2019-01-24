class MensagemBroadcastJob < ApplicationJob
  queue_as :default

  def perform(mensagem)
    ActionCable.server.broadcast "salas_chat_#{mensagem.sala_chat.id}_channel",
                                 mensagem: render_mensagem(mensagem)
  end

  private

  def render_mensagem(mensagem)
    MensagensController.render partial: 'mensagens/mensagem', locals: {mensagem: mensagem}
  end
end
