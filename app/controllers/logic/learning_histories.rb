module Logic
  module LearningHistories

    def save_history_together(current_user_id, targets, is_remember)
      tmp = []
      targets.each do |id|
        tmp << LearningHistory.new(user_id: current_user_id, word_master_id: id, is_remember: is_remember)
      end
      LearningHistory.import tmp
    end

  end
end