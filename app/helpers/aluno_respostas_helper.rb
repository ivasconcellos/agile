module AlunoRespostasHelper

	def resposta_correta(resposta)
		if resposta.correta?
			('<i class="fa fa-check-circle alert alert-success"> ' +  resposta.descricao + '</i>').html_safe
		else
			('<i class="fa fa-exclamation-circle alert alert-danger"> ' +  resposta.descricao + '</i>').html_safe
    	end
	end
end
