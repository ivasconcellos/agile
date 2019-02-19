class AnswerGroupsController < ApplicationController
	before_action :find_question_group!
	before_action :authenticate_usuario!
	respond_to :html, :js, :pdf
	
    def new
      @answer_group_builder = AnswerGroupBuilder.new(answer_group_params)    
    end

	def show
		@answer_group_builder = AnswerGroupBuilder.new(answer_group_params)
		respond_to do |format|
			format.html
			format.pdf {render pdf: "canvas-list-report"}
		end 
	end 

    def create
      @answer_group_builder = AnswerGroupBuilder.new(answer_group_params)
		respond_to do |format|
		  if @answer_group_builder.save
		    format.html {redirect_to(:controller => 'question_groups', :action => 'index', :usuario_id => @question_group.usuario_id)}
			flash[:notice] = ('Questionário respondido com sucesso!')
		  else
		    format.html { render :new }
        	format.json { render json: @answer_group_builder.errors, status: :unprocessable_entity }
		  end
		end
    end

    private
    def find_question_group!
      @question_group = QuestionGroup.find(params[:question_group_id])
    end

    def answer_group_params
      answer_params = { params: params[:answer_group] }
      answer_params.merge(usuario: current_usuario, question_group: @question_group)
    end
  
end
