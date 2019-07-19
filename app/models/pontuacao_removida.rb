class PontuacaoRemovida < ApplicationRecord
  belongs_to :aluno, :class_name => "UsuarioCurso"
  belongs_to :professor, :class_name => "UsuarioCurso"
  validates_presence_of :pontuacao 
  validate :verificar_pontuacao_maxima

  def remover_pontuacao_aluno pontuacao
    
    @usuario = UsuarioCurso.find_by(id: self.aluno_id)
      @usuario.pontos_experiencia = @usuario.pontos_experiencia - self.pontuacao
    @usuario.save
    
    Nivel.verifica_nivel(@usuario)
    Badge.verifica_badge(@usuario)
    Artefato.verifica_artefato(@usuario)
  end

  private

  def verificar_pontuacao_maxima
    @usuario = UsuarioCurso.find_by(id: self.aluno_id)

    if self.pontuacao
  		if self.pontuacao > @usuario.pontos_experiencia
        errors.add(:pontuacao, " removida é superior a nota máxima do aluno!" )
        errors.add(@usuario.pontos_experiencia.to_s, " é nota máxima permitida para remoção!"  )
  		end
    end
  end
end
