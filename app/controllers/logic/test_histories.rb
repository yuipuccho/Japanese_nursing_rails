module Logic
  module TestHistories

    def save_history_together(current_user_id, targets, is_correct_answer)
      tmp = []
      targets.each do |id|
        tmp << TestHistory.new(user_id: current_user_id, word_master_id: id, is_correct_answer: is_correct_answer)
      end

      TestHistory.import tmp
    end

  end
end