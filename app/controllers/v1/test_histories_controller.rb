module V1
  class TestHistoriesController < ApplicationController
    include Logic::TestHistories
    before_action :authenticated!

    def create
      ActiveRecord::Base.transaction do
        if params[:correct_ids]
          save_history_together(current_user.id, params[:correct_ids].split(','), true)
        end
        if params[:mistake_ids]
          save_history_together(current_user.id, params[:mistake_ids].split(','), false)
        end
      end
      render_success_json t('test_histories.create.success')
    rescue StandardError
      render_failed_json t('test_histories.create.failed')
    end

    def status
      @all_word_count = UnitMaster.select(:word_count).pluck(:word_count).sum
      test_histories = current_user.test_histories.desc
      @test_history_correct_word_ids = []
      @test_history_mistake_word_ids = []
      test_histories.each do |test_history|
        word_id = test_history.word_master_id
        if test_history.is_correct_answer && !@test_history_mistake_word_ids.include?(word_id) && !@test_history_correct_word_ids.include?(word_id)
          @test_history_correct_word_ids << word_id
        elsif !test_history.is_correct_answer && !@test_history_correct_word_ids.include?(word_id) && !@test_history_mistake_word_ids.include?(word_id)
          @test_history_mistake_word_ids << word_id
        end
      end
      @unquestioned_word_count = @all_word_count - (@test_history_correct_word_ids | @test_history_mistake_word_ids).count
      render 'api/v1/test_histories/status', handlers: 'jbuilder'
    end

  end
end
