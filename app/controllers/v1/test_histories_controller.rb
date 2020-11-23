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

  end
end
