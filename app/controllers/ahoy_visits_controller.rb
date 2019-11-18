class AhoyVisitsController < ApplicationController
	before_action :authenticate_admin!

    def index
    	authorize! :index, :visit
        @q = Usuario.group(:id).joins(:visits).ransack(params[:q])
        @usuarios = @q.result.paginate(page: params[:page]).order('nome')
    end

    def show
    	authorize! :show, :visit
    	@usuario = Usuario.find(params[:id])
        @visitas = Ahoy::Visit.where('usuario_id = ?', params[:id]).paginate(page: params[:page]).order('started_at desc')
    end
end
