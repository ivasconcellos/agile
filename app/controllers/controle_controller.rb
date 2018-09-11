class ControleController < ApplicationController
  def inicial
  	@cursos = UsuarioCurso.where(usuario_id: current_usuario)
  	render layout: 'neutro'
  end

  def sobre
  	render layout: 'tema'
  end
end
