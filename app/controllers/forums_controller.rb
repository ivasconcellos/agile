class ForumsController < ApplicationController

   def index
     @curso_id = Curso.where(curso_id: current_usuario.curso_atual_id).page(params[:page])
     authorize! :index, @curso_id
   end
   def new
    @forum = Forum.new
   end
   def create
    @forum = Forum.new(forum_params)
   end

  private
    def post_params
      params.require(:forum).permit(:titulo, :descricao)
    end
end
