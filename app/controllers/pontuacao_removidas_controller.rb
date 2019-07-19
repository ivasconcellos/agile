class PontuacaoRemovidasController < ApplicationController
  before_action :set_pontuacao_removida, only: [:show, :edit, :update, :destroy]

  # GET /pontuacao_removidas
  # GET /pontuacao_removidas.json
  def index
    @pontuacao_removidas = PontuacaoRemovida.all
  end

  # GET /pontuacao_removidas/1
  # GET /pontuacao_removidas/1.json
  def show
  end

  # GET /pontuacao_removidas/new
  def new
    @pontuacao_removida = PontuacaoRemovida.new
    @pontuacao_removida.aluno_id =  UsuarioCurso.find_by(id: params[:aluno_id]).id
    @pontuacao_removida.professor_id = @perfil.id
  end

  # GET /pontuacao_removidas/1/edit
  def edit
  end

  # POST /pontuacao_removidas
  # POST /pontuacao_removidas.json
  def create
    @pontuacao_removida = PontuacaoRemovida.new(pontuacao_removida_params)
    respond_to do |format|
      if @pontuacao_removida.save
        @pontuacao_removida.remover_pontuacao_aluno(nil)
        format.html { redirect_to @pontuacao_removida, notice: 'Pontuacao removida com sucesso.' }
        format.json { render :show, status: :created, location: @pontuacao_removida }
      else
        format.html { render :new }
        format.json { render json: @pontuacao_removida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pontuacao_removidas/1
  # PATCH/PUT /pontuacao_removidas/1.json
  def update
    respond_to do |format|
      if @pontuacao_removida.update(pontuacao_removida_params)
        format.html { redirect_to @pontuacao_removida, notice: 'Pontuacao removida was successfully updated.' }
        format.json { render :show, status: :ok, location: @pontuacao_removida }
      else
        format.html { render :edit }
        format.json { render json: @pontuacao_removida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pontuacao_removidas/1
  # DELETE /pontuacao_removidas/1.json
  def destroy
    @pontuacao_removida.destroy
    respond_to do |format|
      format.html { redirect_to pontuacao_removidas_url, notice: 'Pontuacao removida was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pontuacao_removida
      @pontuacao_removida = PontuacaoRemovida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pontuacao_removida_params
      params.require(:pontuacao_removida).permit(:pontuacao, :justificativa, :aluno_id, :professor_id)
    end
end
