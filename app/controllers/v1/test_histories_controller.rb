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
      @all_word_count = UnitMaster.all.pluck(:word_count).sum
      test_history = current_user.test_histories
      @test_history_correct_word_ids = test_history.corrects.pluck(:word_master_id).uniq
      @test_history_mistake_word_ids = test_history.mistakes.pluck(:word_master_id).uniq
      @unquestioned_word_count = @all_word_count - (@test_history_correct_word_ids | @test_history_mistake_word_ids).count
      render 'api/v1/test_histories/status', handlers: 'jbuilder'
    end

  end
end
