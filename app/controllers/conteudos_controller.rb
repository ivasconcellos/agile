class ConteudosController < ApplicationController
  before_action :set_conteudo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  # GET /conteudos
  # GET /conteudos.json
  def index
    @conteudos = Conteudo.where(curso_id: current_usuario.curso_atual_id).page(params[:page]).order('nome')
    authorize! :index, @conteudos
  end

  # GET /conteudos/1
  # GET /conteudos/1.json
  def show
    authorize! :show, @conteudo
    @materiais = Material.where(conteudo_id: @conteudo)
    @explicacoes = Explicacao.where(conteudo_id: @conteudo)
  end

  # GET /conteudos/new
  def new
    @conteudo = Conteudo.new
    @conteudo.curso_id = params[:curso_id]
    authorize! :new, @conteudo
  end

  # GET /conteudos/1/edit
  def edit
    authorize! :edit, @conteudo
  end

  # POST /conteudos
  # POST /conteudos.json
  def create
    @conteudo = Conteudo.new(conteudo_params)

    respond_to do |format|
      if @conteudo.save
        format.html { redirect_to @conteudo, notice: 'Conteúdo criado com sucesso!' }
        format.json { render :show, status: :created, location: @conteudo }
      else
        format.html { render :new, @current_usuario => current_usuario }
        format.json { render json: @conteudo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conteudos/1
  # PATCH/PUT /conteudos/1.json
  def update
    respond_to do |format|
      if @conteudo.update(conteudo_params)
        format.html { redirect_to @conteudo, notice: 'Conteúdo atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @conteudo }
      else
        format.html { render :edit, @current_usuario => current_usuario }
        format.json { render json: @conteudo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conteudos/1
  # DELETE /conteudos/1.json
  def destroy
    authorize! :destroy, @conteudo
    @conteudo.destroy
    respond_to do |format|
      format.html { redirect_to conteudos_url, notice: 'Conteúdo excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conteudo
      @conteudo = Conteudo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conteudo_params
      params.require(:conteudo).permit(:nome, :descricao, :curso_id)
    end
end
