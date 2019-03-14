class QuestionsController < ApplicationController
	before_action :authenticate_usuario!
	before_action :find_question_group!, except: [:show]
	before_action :find_question!, :only => [:edit, :update, :destroy]
	
	def index
		@questions = @question_group.questions
		authorize! :index, Question
	end

	def show
		@question = Question.find(params[:id])
		authorize! :show, Question
	end

	def new
		@questions = QuestionForm::QUESTION_TYPES.clone
		@questions["Data"] = "Questions::Date"
		@questions["Numerico"] = "Questions::Numeric"
		@questions.delete('Date')
		@questions.delete('Numeric')
		@question = QuestionForm.new(:question_group => @question_group)
		@question.question_group_id = params[:question_group_id]
		@question.tipo = params[:tipo]
		authorize! :new, Question
	end

	def create
		form_params = params[:question].merge(:question_group => @question_group)
		
		@question = QuestionForm.new(form_params)
		respond_to do |format|
			if @question.save and !@question.pergunta.empty?
				format.html {redirect_to(:controller => 'questions', :action => 'index', :usuario_curso_id => @question.question_group.usuario_curso_id)}
				flash[:notice] = ('Pergunta cadastrada com sucesso!')
				format.json { render json: @question, status: :created, location: @question }
			else
				format.html { render action: "new" }
				format.json { render json: @question.errors, status: :unprocessable_entity }
			end	
		end
	end

	def edit
		@questions = QuestionForm::QUESTION_TYPES.clone
		@questions["Data"] = "Questions::Date"
		@questions["Numerico"] = "Questions::Numeric"
		@questions.delete('Date')
		@questions.delete('Numeric')
		@question = QuestionForm.new(:question => @question)
		authorize! :edit, Question
	end

	def update
		form_params = params[:question].merge(:question => @question)
		@question = QuestionForm.new(form_params)
		respond_to do |format|
			if @question.save
				format.html {redirect_to(:controller => 'questions', :action => 'show')}
				flash[:notice] = ('Pergunta atualizada com sucesso!')
				format.json { render json: @question, status: :created, location: @question }
			else
				format.html { render action: "edit" }
				format.json { render json: @question.errors, status: :unprocessable_entity }
			end	
		end
	end

	def destroy
		authorize! :destroy, Question
		@grupo = @question.question_group_id
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
