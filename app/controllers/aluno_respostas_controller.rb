class AlunoRespostasController < ApplicationController
  before_action :set_aluno_resposta, only: [:show, :edit, :update, :destroy]

  # GET /aluno_respostas
  # GET /aluno_respostas.json
  def index
    @aluno_respostas = AlunoResposta.all
  end

  # GET /aluno_respostas/1
  # GET /aluno_respostas/1.json
  def show
  end

  # GET /aluno_respostas/new
  def new
    @aluno_resposta = AlunoResposta.new
  end

  # GET /aluno_respostas/1/edit
  def edit
  end

  # POST /aluno_respostas
  # POST /aluno_respostas.json
  def create
    @aluno_resposta = AlunoResposta.new(aluno_resposta_params)

    respond_to do |format|
      if @aluno_resposta.save
        format.html { redirect_to @aluno_resposta, notice: 'Aluno resposta was successfully created.' }
        format.json { render :show, status: :created, location: @aluno_resposta }
      else
        format.html { render :new }
        format.json { render json: @aluno_resposta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aluno_respostas/1
  # PATCH/PUT /aluno_respostas/1.json
  def update
    respond_to do |format|
      if @aluno_resposta.update(aluno_resposta_params)
        format.html { redirect_to @aluno_resposta, notice: 'Aluno resposta was successfully updated.' }
        format.json { render :show, status: :ok, location: @aluno_resposta }
      else
        format.html { render :edit }
        format.json { render json: @aluno_resposta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aluno_respostas/1
  # DELETE /aluno_respostas/1.json
  def destroy
    @aluno_resposta.destroy
    respond_to do |format|
      format.html { redirect_to aluno_respostas_url, notice: 'Aluno resposta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno_resposta
      @aluno_resposta = AlunoResposta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aluno_resposta_params
      params.require(:aluno_resposta).permit(:usuario_curso_id, :respostas_perguntas_id)
    end
end
