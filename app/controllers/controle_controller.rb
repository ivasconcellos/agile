class ControleController < ApplicationController
  def inicial
  	@cursos_publicos = Curso.where(publico: true).paginate(:page => params[:page], :per_page => 6)
  	if params[:nome]
  		@cursos_publicos = @cursos_publicos.where("nome like ? ", "%#{params[:nome]}%")
  	end
  	if params[:codigo_aceso]
  		@cursos_publicos = @cursos_publicos.where(codigo_aceso: params[:codigo_aceso])
  	end

  	@cursos = UsuarioCurso.where(usuario_id: current_usuario)
  	render layout: 'neutro'
  end

  def sobre
  	render layout: 'tema'
  end
end
