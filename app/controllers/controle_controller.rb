class ControleController < ApplicationController
  before_action :authenticate_usuario!, :except => [:sobre, :contato]
  skip_before_action :perfil
  before_action :perfil, except: [:sobre, :contato]

  def inicial
  	@cursos_publicos = Curso.where(publico: true, ativo: true).paginate(:page => params[:page], :per_page => 6).order('updated_at')
  	if params[:nome]
  		@cursos_publicos = @cursos_publicos.where("nome like ? ", "%#{params[:nome]}%").order('updated_at')
  	end
  	if params[:codigo_aceso]
  		@cursos_publicos = @cursos_publicos.where(codigo_aceso: params[:codigo_aceso]).order('updated_at')
  	end

  	@meuscursos = UsuarioCurso.where(usuario_id: current_usuario).order('updated_at')
  	render layout: 'neutro'
  end

  def sobre
  	render layout: 'neutro'
  end

  def contato
  	render layout: 'neutro'
  end

  def desenvolvimento
    render layout: 'neutro'
  end

  def controle_professor
    authorize! :controle_professor,:controle
  end
  
  def controle_gestor
    authorize! :controle_gestor,:controle
  end

end
