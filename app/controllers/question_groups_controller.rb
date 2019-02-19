class QuestionGroupsController < ApplicationController
	before_action :set_question_group, only: [:show, :edit, :update, :destroy]
	respond_to :json, only: :results
	respond_to :html, :js
	def index
		@question_groups = QuestionGroup.all
	end

	def show
  	end

	def new
		@question_group = QuestionGroup.new
		@question_group.usuario_id = params[:usuario_id]		
	end

	def edit
  	end

	def create
		@question_group = QuestionGroup.new(question_group_params)
		respond_to do |format|
			if @question_group.save
				format.html {redirect_to(:controller => 'question_groups', :action => 'index')}
				flash[:notice] = ('Questionário cadastrado com sucesso!')
				format.json { render json: @question_group, status: :created, location: @question_group }
			else
				format.html { render action: "new" }
				format.json { render json: @question_group.errors, status: :unprocessable_entity }
			end	
		end
	end
	
	def update
    respond_to do |format|
      if @question_group.update(question_group_params)
        format.html {redirect_to(:controller => 'question_groups', :action => 'show', :usuario_id => @question_group.usuario_id)}
		flash[:notice] = ('Questionário atualizado com sucesso!')
        format.json { head :no_content }
      else
		@usuario_atual = usuario.where(:id => @question_group.usuario_id).first
		@perfil = PerfilUser.where(:user_id => current_user, :usuario_id => @usuario_atual).first
        format.html { render action: "edit" }
        format.json { render json: @question_group.errors, status: :unprocessable_entity }
      end
    end
  end

	def set_question_group
      @question_group = QuestionGroup.find(params[:id])
    end

	def destroy
		@usuario = @question_group.usuario_id
		@question_group.destroy
		respond_to do |format|
      		format.html { redirect_to :controller => 'question_groups', :action => 'index', :usuario_id => @usuario}
			flash[:notice] = ('Questionário excluído com sucesso!')
      		format.json { head :no_content }
    	end

	end

	def results
		
		@question_group = QuestionGroup.find(params[:id])
		
		@question_group_results =
		QuestionGroupResults.new(question_group: @question_group).extract
		respond_with(@question_group_results, root: false)
	end
	private
	def question_group_params
		params.require(:question_group).permit(:titulo, :descricao, :objetivo, :usuario_id)
	end
end
