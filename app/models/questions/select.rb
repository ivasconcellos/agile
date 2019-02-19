  module Questions
    class Select < Question
      validates :respostas, :presence => true

      def options
        respostas.split(Rapidfire.answers_delimiter)
      end

      def validate_answer(answer)
        super(answer)

        if rules[:presence] == "1" || answer.resposta.present?
          answer.validates_inclusion_of :resposta, :in => options
        end
      end
    end
  end

