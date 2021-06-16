class QuizPerguntaResposta < ApplicationRecord
  belongs_to :quiz_pergunta
  has_many :quiz_respostas_alunos, dependent: :destroy
  validates_presence_of :descricao

  validate :existe_correta

  def existe_correta
    if self.id
    	@correta = QuizPerguntaResposta.where('quiz_pergunta_id =? and correta = ? and id != ?', self.quiz_pergunta_id, true, self.id)
    else
      @correta = QuizPerguntaResposta.where(quiz_pergunta_id: self.quiz_pergunta_id, correta: true)
    end

  	if !@correta.empty? and self.correta == true
  		errors.add(:correta, " - Já existe uma resposta correta para esta pergunta!")
  	else
  		return false  		
  	end

  end

end
