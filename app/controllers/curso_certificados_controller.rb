class CursoCertificadosController < ApplicationController
  before_action :authenticate_usuario!, :except => [:validar_certificado, :certificado_validado]
  skip_before_action :perfil
  before_action :perfil, except: [:validar_certificado, :certificado_validado]

  def validar_certificado
    if not params[:codigo_validacao]
      render layout: 'neutro'
    else
      @validacao = CursoCertificado.find_by(hash_validacao: params[:codigo_validacao])
      respond_to do |format|
        if @validacao
          format.html { redirect_to certificado_validado_path(id: @validacao.id) }
        else
          format.html { redirect_to validar_certificado_path, alert: 'Certificado não encontrado! Por favor verifique o código do seu certificado.', layout: 'neutro' }
        end
      end
    end
  end

  def certificado_validado
    @validacao = CursoCertificado.find_by(id: params[:id])
    render layout: 'neutro'
  end

  def gerar_certificado
    authorize! :gerar_certificado, CursoCertificado
    @curso_certificado = CursoCertificado.find_by(usuario_id: current_usuario.id, curso_id: @perfil.curso.id)
    respond_to do |format|
      format.pdf do
            render pdf: "Certificado do curso",
            page_size: "A4",
            title: "Certificado do curso",
            orientation: 'Landscape',
            margin: { :top => 0, :bottom => 0, :left => 0, :right => 0}                                
      end
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_certificado_params
      params.require(:curso_certificado).permit(:usuario_id, :curso_id, :hash_validacao, :data_finalizacao)
    end
end
