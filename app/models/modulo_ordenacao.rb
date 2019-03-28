class ModuloOrdenacao < ApplicationRecord
	belongs_to :modulo
	validates_presence_of  :classe, :classe_id

	def self.ordenar(objeto)
	    
	    ModuloOrdenacao.create!(modulo_id: objeto.modulo_id, classe: objeto.class.name, classe_id: objeto.id )
	end

	def objeto
		classe = self.classe.constantize
		obj = classe.find_by(id: self.classe_id)
		
		return obj
	end

end
