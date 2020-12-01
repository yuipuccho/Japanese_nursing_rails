module Logic
  module WordMasters

    def test_params_error!(params)
      render_failed_json t('word_masters.test.question_range_error') unless params[:question_range]
    end

  end
end