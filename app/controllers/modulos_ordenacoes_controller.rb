class ModulosOrdenacoesController < ApplicationController

    protect_from_forgery :except => [:sort]
    def sort
    	authorize! :reordernar, :modulo_ordenacao
        params[:modulo_ordenacao].each_with_index do |id, index|
            ModuloOrdenacao.where(id: id).update_all(position: index + 1)
        end

        head :ok
    end

end