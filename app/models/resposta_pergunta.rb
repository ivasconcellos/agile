class RespostaPergunta < ApplicationRecord
  belongs_to :pergunta_quiz
  has_many :aluno_respostas
  validates_presence_of :descricao

  validate :existe_correta

  def existe_correta
  	@correta = RespostaPergunta.where(pergunta_quiz_id: self.pergunta_quiz_id, correta: true)
  	if !@correta.empty? and self.correta == true
  		errors.add(:correta, " - Já existe uma resposta correta para esta pergunta!")
  	else
  		return false  		
  	end

  end

end
