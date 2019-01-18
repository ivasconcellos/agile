class UsuariosController < ApplicationController

	before_action :authenticate_usuario!

	def minhas_notas
		@tarefas = Tarefa.joins(:modulo).where('modulos.curso_id = ?',
       current_usuario.curso_atual_id).page(params[:page])
	end

end