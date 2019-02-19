  module Questions
    class Date < Question
      def validate_answer(answer)
        super(answer)

        if rules[:presence] == "1" || answer.resposta.present?
          begin  ::Date.parse(answer.resposta.to_s)
          rescue ArgumentError => e
            answer.errors.add(:resposta, :invalid)
          end
        end
      end
    end
  end

