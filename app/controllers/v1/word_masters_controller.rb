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

      @tests = nil
      limit = params[:limit] || 20
      case params[:question_range].to_i
      when 0 then
        # すべて
        word_masters = WordMaster.get_random_words(limit)
        dummy_words = WordMaster.all.shuffle
        @tests = generate_tests(word_masters, dummy_words)
      when 1 then
        # 苦手
        mistake_ids = current_user
                      .test_histories
                      .mistakes
                      .pluck(:word_master_id)
                      .uniq
        word_masters = WordMaster.where(id: mistake_ids).get_random_words(limit)
        dummy_words = WordMaster.all.shuffle
        @tests = generate_tests(word_masters, dummy_words)
      when 2 then
        # 未出題
        asked_ids = current_user
                    .test_histories
                    .pluck(:word_master_id)
                    .uniq
        word_masters = WordMaster.where.not(id: asked_ids).get_random_words(limit)
        dummy_words = WordMaster.all.shuffle
        @tests = generate_tests(word_masters, dummy_words)
      when 3 then
        # 苦手 + 未出題
        correct_words = current_user
                        .test_histories
                        .corrects
                        .pluck(:word_master_id)
                        .uniq
        dummy_words = WordMaster.all.shuffle
        word_masters = dummy_words.reject { |w| correct_words.include?(w.id) }
        @tests = generate_tests(word_masters, dummy_words)
      else
        render_failed_json t('word_masters.test.invalid_question_range_error')
        return
      end
      render 'api/v1/word_masters/test', handlers: 'jbuilder'
    end

    private

    def word_master_params
      params.permit(:furigana, :japanese, :vietnamese, :english)
    end

  end
end
