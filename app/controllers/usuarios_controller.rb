class UsuariosController < ApplicationController

	before_action :authenticate_usuario!

	def minhas_notas
		@modulos = Modulo.where('modulos.curso_id = ?',
       current_usuario.curso_atual_id)
	end

end