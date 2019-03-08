module MissoesHelper

	def ativa(missao)
		if !missao.ativo?
			('<i class="fa fa-exclamation-circle text-danger"> ' +  missao.nome +  + ' - Inativa!' + '</i>').html_safe
		else
			missao.nome
    	end
	end
end
