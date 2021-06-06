class ControleController < ApplicationController
  before_action :authenticate_any!, :except => [:sobre, :contato]

  def inicial
  	@q = Curso.ransack(params[:q])
    @cursos_publicos = @q.result.where(publico: true, ativo: true).paginate(:page => params[:page], :per_page => 6).order('updated_at')

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
