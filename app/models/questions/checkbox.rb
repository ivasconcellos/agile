  module Questions
    class Checkbox < Question
      validates :respostas, :presence => true

      def options
        respostas.split(Rapidfire.answers_delimiter)
      end

      def validate_answer(answer)
        super(answer)

        if rules[:presence] == "1" || answer.resposta.present?
          answer.resposta.split(Rapidfire.answers_delimiter).each do |value|
            answer.errors.add(:resposta, :invalid) unless options.include?(value)
          end
        end
      end
    end
  end

