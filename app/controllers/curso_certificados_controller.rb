class CursoCertificadosController < ApplicationController
  before_action :set_curso_certificado, only: [:show, :edit, :update, :destroy]

  
  # GET /curso_certificados/1
  # GET /curso_certificados/1.json
  def gerar_certificado
    @curso_certificado = CursoCertificado.find_by(usuario_id: current_usuario.id, curso_id: @perfil.curso.id)
    respond_to do |format|
      format.html
      format.pdf do
            render pdf: "Certificado do curso",
            page_size: "A4",
            title: "Certificado do curso",
            orientation: 'Landscape'
      end
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def curso_certificado_params
      params.require(:curso_certificado).permit(:usuario_id, :curso_id, :hash_validacao, :data_finalizacao)
    end
end
