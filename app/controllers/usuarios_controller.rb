class UsuariosController < ApplicationController

	before_action :authenticate_usuario!

	def minhas_notas
		@modulos = Modulo.where('modulos.curso_id = ?',
       current_usuario.curso_atual_id)
	end

	def notas_aluno
		@aluno = UsuarioCurso.find_by('usuario_curso.id = ? and curso_id = ?',
       params[:aluno_id], params[:curso_id])
	end
end