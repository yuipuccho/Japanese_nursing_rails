module Logic
  module WordMasters

    def test_params_error!(params)
      render_failed_json t('word_masters.test.question_range_error') unless params[:question_range]
    end

    def generate_tests(correct_words, dummy_words)
      tests = []
      correct_words.each do |word|
        dummies = dummy_words.reject { |w| w.id == word.id }.sample(3)
        tests << {
          id: word.id,
          japanese: word.japanese,
          furigana: word.furigana,
          vietnamese: word.vietnamese,
          dummy_vietnamese_1: dummies[0].vietnamese,
          dummy_vietnamese_2: dummies[1].vietnamese,
          dummy_vietnamese_3: dummies[2].vietnamese
        }
      end
      tests
    end

  end
end