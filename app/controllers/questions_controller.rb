class QuestionsController < ApplicationController
	before_action :authenticate_usuario!
	before_action :find_question_group!, except: [:show]
	before_action :find_question!, :only => [:edit, :update, :destroy]
	
	def index
		authorize! :index, Question
		@questions = @question_group.questions
	end

	def show
		authorize! :show, Question
		@question = Question.find(params[:id])
	end

	def new
		authorize! :new, Question
		@question = QuestionForm.new(:question_group => @question_group)
		@question.question_group_id = params[:question_group_id]
		@question.tipo = params[:tipo]
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
		authorize! :edit, Question
		@question = QuestionForm.new(:question => @question)
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
		
		respond_to do |format|
			if @question.destroy
	      		format.html { redirect_to :controller => 'questions', :action => 'index', :question_group_id => @grupo, :empresa_id => @empresa }
				flash[:notice] = ('Pergunta excluída com sucesso!')
	      		format.json { head :no_content }
	      	else
	      		format.html { redirect_to :controller => 'questions', :action => 'index', :question_group_id => @grupo, :empresa_id => @empresa }
				flash[:alert] = ('A Pergunta não pôde ser excluída, pois está sendo utilizada!')
	      		format.json { head :no_content }
	      	end
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
