module ModelLogic
  module WordMaster
    def update_word_master_count!(unit_master_id)
      unit_master = UnitMaster.find(unit_master_id)
      unit_master.increment!(:word_count)
    end
  end
end