class TarefaEntregarsController < ApplicationController
  before_action :set_tarefa_entregar, only: [:show, :edit, :update, :destroy]

  # GET /tarefa_entregars
  # GET /tarefa_entregars.json
  def index
    @tarefa_entregars = TarefaEntregar.joins(:usuario_curso).where('usuario_curso.curso_id= ?', current_usuario.curso_atual_id)
  end

  # GET /tarefa_entregars/1
  # GET /tarefa_entregars/1.json
  def show
      @current_usuario = current_usuario
  end

  # GET /tarefa_entregars/new
  def new
    @tarefa_entregar = TarefaEntregar.new
    @tarefa_entregar.tarefa_id = params[:tarefa_id]
    @usuario_curso_id = UsuarioCurso.find_by(usuario_id: current_usuario.id, curso_id: current_usuario.curso_atual.id).id
  end

  # GET /tarefa_entregars/1/edit
  def edit
    @current_usuario = current_usuario
    @usuario_curso_id = UsuarioCurso.find_by(usuario_id: current_usuario.id, curso_id: current_usuario.curso_atual.id).id

  end

  # POST /tarefa_entregars
  # POST /tarefa_entregars.json
  def create
    @tarefa_entregar = TarefaEntregar.new(tarefa_entregar_params)

    respond_to do |format|
      if @tarefa_entregar.save
        format.html { redirect_to @tarefa_entregar, notice: 'Tarefa entregar was successfully created.' }
        format.json { render :show, status: :created, location: @tarefa_entregar }
      else
        format.html { render :new,  @current_usuario => current_usuario  }
        format.json { render json: @tarefa_entregar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarefa_entregars/1
  # PATCH/PUT /tarefa_entregars/1.json
  def update
    respond_to do |format|
      if @tarefa_entregar.update(tarefa_entregar_params)
        format.html { redirect_to @tarefa_entregar, notice: 'Tarefa entregar was successfully updated.' }
        format.json { render :show, status: :ok, location: @tarefa_entregar }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @tarefa_entregar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarefa_entregars/1
  # DELETE /tarefa_entregars/1.json
  def destroy
    @tarefa_entregar.destroy
    respond_to do |format|
      format.html { redirect_to tarefa_entregars_url, notice: 'Tarefa entregar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa_entregar
      @tarefa_entregar = TarefaEntregar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarefa_entregar_params
      params.require(:tarefa_entregar).permit(:tarefa_id, :usuario_curso_id, :comentario, :arquivo)
    end
end
