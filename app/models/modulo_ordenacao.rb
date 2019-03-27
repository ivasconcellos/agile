class ModuloOrdenacao < ApplicationRecord
	belongs_to :modulo
	validates_presence_of :indice, :classe, :classe_id

	def self.ordenar(objeto)
	    @indice = ModuloOrdenacao.where(modulo_id: objeto.modulo_id).maximum("indice").to_i
	    ModuloOrdenacao.create!(modulo_id: objeto.modulo_id, classe: objeto.class.name, classe_id: objeto.id, indice: @indice + 1 )
	end

	def objeto
		classe = self.classe.constantize
		obj = classe.find_by(id: self.classe_id)
		
		return obj
	end

end
