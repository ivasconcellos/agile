class FaqsController < ApplicationController
  before_action :set_faq, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_any!

  # GET /faqs
  # GET /faqs.json
  def index
    authorize! :index, Faq
    @q = Faq.ransack(params[:q])
    @faqs = @q.result.paginate(page: params[:page])
  end

  # GET /faqs/1
  # GET /faqs/1.json
  def show
    authorize! :show, Faq
  end

  # GET /faqs/new
  def new
    authorize! :new, Faq
    @faq = Faq.new
  end

  # GET /faqs/1/edit
  def edit
    authorize! :edit, Faq
  end

  # POST /faqs
  # POST /faqs.json
  def create
    @faq = Faq.new(faq_params)

    respond_to do |format|
      if @faq.save
        format.html { redirect_to @faq, notice: 'FAQ cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @faq }
      else
        format.html { render :new }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faqs/1
  # PATCH/PUT /faqs/1.json
  def update
    respond_to do |format|
      if @faq.update(faq_params)
        format.html { redirect_to @faq, notice: 'FAQ atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @faq }
      else
        format.html { render :edit }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faqs/1
  # DELETE /faqs/1.json
  def destroy
    authorize! :destroy, Faq
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to faqs_url, notice: 'FAQ excluída com sucesso!' }
      format.json { head :no_content }
    end
  end

  def faq_agile
    @q = Faq.ransack(params[:q])
    @faqs = @q.result.paginate(page: params[:page])
    render layout: 'neutro'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faq
      @faq = Faq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faq_params
      params.require(:faq).permit(:pergunta, :resposta)
    end
end
