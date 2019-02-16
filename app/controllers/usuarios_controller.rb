class UsuariosController < ApplicationController
	before_action :set_usuario, only: [:edit, :show, :update]
	before_action :authenticate_usuario!, :except => [:termo_compromisso]

	def index
    	@usuarios = Usuario.page(params[:page]).order('nome')
    	authorize! :index, Usuario
	end

	def edit
		authorize! :edit, Usuario
	end

	def show
		authorize! :show, Usuario
	end 

	def update
		respond_to do |format|
	      if @usuario.update(usuario_params)
	        format.html { redirect_to @usuario, notice: 'Usuário atualizado com sucesso!' }
	        format.json { render :show, status: :ok, location: @usuario }
	      else
	        format.html { render :edit }
	        format.json { render json: @usuario.errors, status: :unprocessable_entity }
	      end
	    end
	end 

	private 

	def set_usuario
    	@usuario = Usuario.find(params[:id])
    end

    def usuario_params
    	params.require(:usuario).permit(:nome, :email, :perfil, :data_nascimento, :sexo, :ativo, :termo_compromisso, :password, :password_confirmation, :updated_at, )
    end

	def minhas_notas
		@modulos = Modulo.where('modulos.curso_id = ?',
       current_usuario.curso_atual_id)
	end

	def notas_aluno
		@aluno = UsuarioCurso.find_by('usuario_curso.id = ? and curso_id = ?',
       params[:aluno_id], params[:curso_id])
	end

	def termo_compromisso
		render layout: 'tema'
		respond_to do |format|
    		format.html
    		format.js
  		end
	end

end