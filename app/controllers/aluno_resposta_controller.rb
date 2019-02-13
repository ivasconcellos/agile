class AlunoRespostaController < ApplicationController
  before_action :set_aluno_respostum, only: [:show, :edit, :update, :destroy]

  # GET /aluno_resposta
  # GET /aluno_resposta.json
  def index
    @aluno_resposta = AlunoRespostum.all
  end

  # GET /aluno_resposta/1
  # GET /aluno_resposta/1.json
  def show
  end

  # GET /aluno_resposta/new
  def new
    @aluno_respostum = AlunoRespostum.new
  end

  # GET /aluno_resposta/1/edit
  def edit
  end

  # POST /aluno_resposta
  # POST /aluno_resposta.json
  def create
    @aluno_respostum = AlunoRespostum.new(aluno_respostum_params)

    respond_to do |format|
      if @aluno_respostum.save
        format.html { redirect_to @aluno_respostum, notice: 'Aluno respostum was successfully created.' }
        format.json { render :show, status: :created, location: @aluno_respostum }
      else
        format.html { render :new }
        format.json { render json: @aluno_respostum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aluno_resposta/1
  # PATCH/PUT /aluno_resposta/1.json
  def update
    respond_to do |format|
      if @aluno_respostum.update(aluno_respostum_params)
        format.html { redirect_to @aluno_respostum, notice: 'Aluno respostum was successfully updated.' }
        format.json { render :show, status: :ok, location: @aluno_respostum }
      else
        format.html { render :edit }
        format.json { render json: @aluno_respostum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aluno_resposta/1
  # DELETE /aluno_resposta/1.json
  def destroy
    @aluno_respostum.destroy
    respond_to do |format|
      format.html { redirect_to aluno_resposta_url, notice: 'Aluno respostum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno_respostum
      @aluno_respostum = AlunoRespostum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aluno_respostum_params
      params.require(:aluno_respostum).permit(:aluno_curso_id, :respostas_perguntas_id, :correta)
    end
end
