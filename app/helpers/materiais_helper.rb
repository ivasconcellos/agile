module MateriaisHelper

	def extlink(link)
	
		if !(link.include?("http://") || link.include?("https://"))
		  link.insert(0, "http://")
		end
		link
	end

	def publico(material)
		if !material.publico?
			('<i class="fa fa-exclamation-circle text-danger"> ' +  material.nome +  + ' - Não publicado!' + '</i>').html_safe
		else
			material.nome
    	end
	end
	
end
