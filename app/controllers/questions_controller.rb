class QuestionsController < ApplicationController

	respond_to :html, :js
	before_action :find_question_group!
	before_action :find_question!, :only => [:edit, :update, :destroy]
	
	def index
		@questions = @question_group.questions
	end

	def new
		@question = QuestionForm.new(:question_group => @question_group)
		@question.question_group_id = params[:question_group_id]
		@question.tipo = params[:tipo]
	end

	def create
		form_params = params[:question].merge(:question_group => @question_group)
		
		@question = QuestionForm.new(form_params)
		respond_to do |format|
			if @question.save and !@question.pergunta.empty?
				format.html {redirect_to(:controller => 'questions', :action => 'index', :usuario_id => @question.question_group.usuario_id)}
				flash[:notice] = ('Pergunta cadastrada com sucesso!')
				format.json { render json: @question, status: :created, location: @question }
			else
				format.html { render action: "new" }
				format.json { render json: @question.errors, status: :unprocessable_entity }
			end	
		end
	end

	def edit
		@question = QuestionForm.new(:question => @question)
	end

	def update
		form_params = params[:question].merge(:question => @question)
		@question = QuestionForm.new(form_params)
		respond_to do |format|
			if @question.save
				format.html {redirect_to(:controller => 'questions', :action => 'index', :empresa_id => @question.question_group.empresa_id)}
				flash[:notice] = ('Pergunta atualizada com sucesso!')
				format.json { render json: @question, status: :created, location: @question }
			else
				format.html { render action: "new" }
				format.json { render json: @question.errors, status: :unprocessable_entity }
			end	
		end
	end

	def destroy
		@grupo = @question.question_group_id
		@empresa = @question.question_group.empresa_id
		@question.destroy
		respond_to do |format|
      		format.html { redirect_to :controller => 'questions', :action => 'index', :question_group_id => @grupo, :empresa_id => @empresa }
			flash[:notice] = ('Pergunta excluída com sucesso!')
      		format.json { head :no_content }
    	end
	end

	private

	def find_question_group!
		@question_group = QuestionGroup.find(params[:question_group_id])
	end

	def find_question!
		@question = @question_group.questions.find(params[:id])
	end

	def index_location
		question_group_questions_url(@question_group)
	end


end
