class SalasChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "salas_chat_#{params['sala_chat_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def atualiza_online(data)
    ActionCable.server.broadcast("salas_chat_#{params['sala_chat_id']}_channel", comando: "atualizar")
  end

  def online(data)
    ActionCable.server.broadcast("salas_chat_#{params['sala_chat_id']}_channel", usuario: {id: current_user.id, nome: current_user.nome})
  end
  def send_mensagem(data)
  	usuario_curso = UsuarioCurso.select(:id).where(usuario_id: current_user.id, curso_id: current_user.curso_atual_id).first
  	usuario_curso.mensagens.create!(texto: data['mensagem'], sala_chat_id: data['sala_chat_id'])
    
  end
end
