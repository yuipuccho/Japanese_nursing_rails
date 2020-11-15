module V1
  class WordMastersController < ApplicationController
    before_action :authenticated!

    def create
      unless params[:unit_master_id]
        render_failed_json t('word_masters.create.specify_unit_master_id')
      end
      unit_master = UnitMaster.find(params[:unit_master_id])
      word_master = unit_master.word_masters.create(furigana: params[:furigana],
                                                    japanese: params[:japanese],
                                                    vietnamese: params[:vietnamese],
                                                    english: params[:english])
      word_master.save!
      render_success_json t('word_masters.create.success')
    rescue StandardError
      render_failed_json t('word_masters.create.failed')
    end

    def update
      word_master = WordMaster.find(params[:id])
      word_master.update! word_master_params
      render_success_json t('word_masters.update.success')
    rescue StandardError
      render_failed_json t('word_masters.update.failed')
    end

    private

    def word_master_params
      params.permit(:furigana, :japanese, :vietnamese, :english)
    end
  end
end
