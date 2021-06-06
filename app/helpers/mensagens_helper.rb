module MensagensHelper
    def mensagem_lida usuario, destinatario, assunto
        conversas = Conversa.where(usuario_curso_id: destinatario.id, destinatario_id: usuario.id, assunto: assunto, lida: false)
        if conversas.empty?
            return ('<i class="text-success"> ' + 'Lida' + '</i>').html_safe
            
        else
            return ('<i class="text-danger"> ' + 'Não lida' + '</i>').html_safe
        end
    end
end
