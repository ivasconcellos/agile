class AhoyVisitsController < ApplicationController
    def index
        @q = Usuario.group(:id).joins(:visits).ransack(params[:q])
        # @q = Ahoy::Visit.joins(:usuario).group('usuario_id').ransack(params[:q])
        @usuarios = @q.result.paginate(page: params[:page]).order('nome')
    end

    def show
        @visitas = Ahoy::Visit.where('usuario_id = ?', params[:id]).paginate(page: params[:page])
    end
end
