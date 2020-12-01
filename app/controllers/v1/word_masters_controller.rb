module V1
  class WordMastersController < ApplicationController
    before_action :authenticated!

    include Logic::WordMasters

    def create
      unless params[:unit_master_id]
        render_failed_json t('word_masters.create.specify_unit_master_id')
      end
      unit_master = UnitMaster.find(params[:unit_master_id])
      word_master = unit_master.word_masters.create(furigana: params[:furigana],
                                                    japanese: params[:japanese],
                                                    vietnamese: params[:vietnamese],
                                                    english: params[:english])
      word_master.save!
      render_success_json t('word_masters.create.success')
    rescue StandardError
      render_failed_json t('word_masters.create.failed')
    end

    def update
      word_master = WordMaster.find(params[:id])
      word_master.update! word_master_params
      render_success_json t('word_masters.update.success')
    rescue StandardError
      render_failed_json t('word_masters.update.failed')
    end

    def index
      @word_masters = WordMaster.where(unit_master_id: params[:unit_master_id])
      @learned_history_ids = current_user.learning_histories.pluck(:word_master_id).uniq.map(&:to_s)
      render 'api/v1/word_masters/index', handlers: 'jbuilder'
    end

    def test
      unless params[:question_range]
        render_failed_json t('word_masters.test.question_range_error')
        return
      end
      unless (0..2).cover?(params[:question_range].to_i)
        render_failed_json t('word_masters.test.invalid_question_range_error')
        return
      end

      tmp = []
      limit = params[:limit] || 5
      test_histories = nil
      case params[:question_range].to_i
      when 0 then
        word_masters = WordMaster.get_random_words(limit)
        
      when 1 then
      when 2 then
      else
        # type code here
      end
      render 'api/v1/word_masters/test', handlers: 'jbuilder'
    end

    private

    def word_master_params
      params.permit(:furigana, :japanese, :vietnamese, :english)
    end

  end
end
