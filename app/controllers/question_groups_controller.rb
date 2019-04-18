class QuestionGroupsController < ApplicationController
	before_action :set_question_group, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_usuario!
	respond_to :html, only: :results

	def index
		authorize! :index, QuestionGroup
		@question_groups = QuestionGroup.where(curso_id: @perfil.curso_id)
	end

	def show
		authorize! :show, QuestionGroup
  	end

	def new
		authorize! :new, QuestionGroup
		@question_group = QuestionGroup.new
	end

	def edit
		authorize! :edit, QuestionGroup
  	end

	def create
		@question_group = QuestionGroup.new(question_group_params)
		@question_group.usuario_curso_id = @perfil.id
		@question_group.curso_id = @perfil.curso_id
		respond_to do |format|
			if @question_group.save
				format.html { redirect_to @question_group, notice: 'Pesquisa cadastrada com sucesso!'}
        		format.json { render :show, status: :created, location: @question_group }
				else
				format.html { render action: "new" }
				format.json { render json: @question_group.errors, status: :unprocessable_entity }
			end	
		end
	end
	
	def update
	    respond_to do |format|
	      if @question_group.update(question_group_params)
	        format.html { redirect_to @question_group, notice: 'Pesquisa atualizada com sucesso!'}
	        format.json { render :show, status: :created, location: @question_group }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @question_group.errors, status: :unprocessable_entity }
	      end
	    end
  	end

	def destroy
		authorize! :destroy, QuestionGroup
		
		respond_to do |format|
			if @question_group.destroy
	      		format.html { redirect_to question_groups_url, notice: 'Pesquisa excluída com sucesso!' }
	      		format.json { head :no_content }
	      	else
	      		format.html { redirect_to question_groups_url, alert: 'A Pesquisa não pôde ser excluída, pois está sendo utilizada!' }
      			format.json { head :no_content }
	      	end
    	end
	end

	def results
		@question_group = QuestionGroup.find(params[:id])
		@question_group_results =
		QuestionGroupResults.new(question_group: @question_group).extract
		respond_to do |format|
			format.html do
				respond_with(@question_group_results, root: false)
			end
			format.csv
		end
	end

	def graficos
		@question_group = QuestionGroup.find(params[:id])
		@question_group_results =
		QuestionGroupResults.new(question_group: @question_group).extract
	end

	private

		def set_question_group
	      @question_group = QuestionGroup.find(params[:id])
	    end

		def question_group_params
			params.require(:question_group).permit(:titulo, :descricao, :objetivo, :usuario_curso_id, :curso_id, :final_curso)
		end
end
