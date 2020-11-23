module V1
  class UserLearningTargetSerializer < ActiveModel::Serializer
    attributes :result, :message, :id, :target_learning_count, :target_testing_count, :created_at, :updated_at

    def result
      true
    end

    def message
      "取得しました。"
    end
  end
end