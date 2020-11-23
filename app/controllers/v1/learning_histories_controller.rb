module V1
  class LearningHistoriesController < ApplicationController
    include Logic::LearningHistories
    before_action :authenticated!

    def create
      ActiveRecord::Base.transaction do
        if params[:remember_ids]
          save_history_together(current_user.id, params[:remember_ids].split(','), true)
        end
        if params[:not_remember_ids]
          save_history_together(current_user.id, params[:not_remember_ids].split(','), false)
        end
      end
      render_success_json t('learning_histories.create.success')
    rescue StandardError
      render_failed_json t('learning_histories.create.failed')
    end

  end
end
