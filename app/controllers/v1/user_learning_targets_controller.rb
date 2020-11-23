module V1
  class UserLearningTargetsController < ApplicationController
    before_action :authenticated!

    def show
      user_learning_target = UserLearningTarget.find_by(user_id: current_user.id)
      if user_learning_target
        render json: user_learning_target, serializer: UserLearningTargetSerializer
      else
        render_failed_json t('user_learning_targets.show.failed')
      end
    end

    def update
      user_learning_target = UserLearningTarget.find_by!(user_id: current_user.id)
      user_learning_target&.update! update_params
      render_success_json t('user_learning_targets.update.success')
    rescue StandardError
      render_failed_json t('user_learning_targets.update.failed')
    end

    private

    def update_params
      params.permit(:target_learning_count, :target_testing_count)
    end
  end
end
