module MissoesHelper

	def publica(missao)
		if !missao.publico?
			('<i class="fa fa-exclamation-circle text-danger"> ' +  missao.nome +  + ' - Inativa!' + '</i>').html_safe
		else
			missao.nome
    	end
	end
end
