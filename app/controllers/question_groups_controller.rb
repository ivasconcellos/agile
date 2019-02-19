class QuestionGroupsController < ApplicationController
	before_action :set_question_group, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_usuario!
	respond_to :json, only: :results

	def index
		@question_groups = QuestionGroup.all
		authorize! :index, QuestionGroup
	end

	def show
		authorize! :show, QuestionGroup
  	end

	def new
		authorize! :new, QuestionGroup
		@question_group = QuestionGroup.new
		@question_group.usuario_id = params[:usuario_id]		
	end

	def edit
		authorize! :edit, QuestionGroup
  	end

	def create
		@question_group = QuestionGroup.new(question_group_params)
		respond_to do |format|
			if @question_group.save
				format.html { redirect_to @question_group, notice: 'Questionário cadastrado com sucesso!'}
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
	        format.html { redirect_to @question_group, notice: 'Questionário atualizado com sucesso!'}
	        format.json { render :show, status: :created, location: @question_group }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @question_group.errors, status: :unprocessable_entity }
	      end
	    end
  	end

	def destroy
		authorize! :destroy, QuestionGroup
		@question_group.destroy
		respond_to do |format|
      		format.html { redirect_to question_groups_url, notice: 'Questionário excluído com sucesso!' }
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

		def set_question_group
	      @question_group = QuestionGroup.find(params[:id])
	    end

		def question_group_params
			params.require(:question_group).permit(:titulo, :descricao, :objetivo, :usuario_id)
		end
end
