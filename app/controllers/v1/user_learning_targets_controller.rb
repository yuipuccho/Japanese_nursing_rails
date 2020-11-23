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

    end

  end
end
