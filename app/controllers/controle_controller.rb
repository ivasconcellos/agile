class ControleController < ApplicationController
  def inicial
  	@cursos_publicos = Curso.where(publico: true).paginate(:page => params[:page], :per_page => 6).order('updated_at')
  	if params[:nome]
  		@cursos_publicos = @cursos_publicos.where("nome like ? ", "%#{params[:nome]}%").order('updated_at')
  	end
  	if params[:codigo_aceso]
  		@cursos_publicos = @cursos_publicos.where(codigo_aceso: params[:codigo_aceso]).order('updated_at')
  	end

  	@cursos = UsuarioCurso.where(usuario_id: current_usuario).order('updated_at')
  	render layout: 'neutro'
  end

  def sobre
  	render layout: 'tema'
  end

  def desenvolvimento
    render layout: 'neutro'
  end
end
