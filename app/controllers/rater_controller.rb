class RaterController < ApplicationController

  def create
    if usuario_signed_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f.ceil, current_usuario, params[:dimension]

      render :json => true
    else
      render :json => false
    end
  end
end
