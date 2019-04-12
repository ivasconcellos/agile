class UsuariosController < ApplicationController
	before_action :set_usuario, only: [:edit, :show, :update]
	before_action :authenticate_usuario!, :except => [:termo_uso]
	skip_before_action :perfil
	before_action :perfil, except: [:termo_uso]

	def index
		authorize! :index, Usuario
		@q = Usuario.ransack(params[:q])
    	@usuarios = @q.result.paginate(page: params[:page]).order('nome')
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

	def termo_uso
		render layout: 'tema'
		respond_to do |format|
    		format.html
    		format.js
		end
	end

	private 

	def set_usuario
    	@usuario = Usuario.find(params[:id])
    end

    def usuario_params
    	params.require(:usuario).permit(:nome, :email, :perfil, :data_nascimento, :sexo, :ativo, :termo_compromisso, :password, :password_confirmation, :updated_at, )
    end

end