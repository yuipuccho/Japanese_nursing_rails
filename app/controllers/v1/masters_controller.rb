# frozen_string_literal: true

module V1
  class MastersController < ApplicationController
    def show
      master = Master.find(params[:id])
      render json: master, serializer: DefaultSerializer, status: 200
    rescue StandardError
      render_failed_json t('masters.show.not_found')
    end

    def create
      master = ::Master.new master_params
      if params[:name].blank?
        # TODO modelに移動
        render json: { error: "nameを入力してください。" }
      end
      if master.save
        render json: { result: true, message: t('masters.create.success') }
      else
        render json: { result: false, message: t('masters.create.failed') }
      end
    end

    def update
      master = Master.find(params[:id])
      if master.update(master_params)
        render json: { result: true, message: t('masters.update.success')}
      else
        render json: { result: false, message: t('masters.update.failed')}
      end
    rescue StandardError
      render json: { result: false, message: t('apis.update_record_not_found') }
    end

    def destroy
      master = Master.find(params[:id]).destroy!
      render json: { result: true, message: t('masters.destroy.success') }
    rescue StandardError
      render json: { result: false, message: t('masters.destroy.failed') }
    end

    def index
      masters = Master.all
      # TODO: ちゃんと配列で返すようにする
      render json: masters
    end

    private

    def master_params
      params.require(:master).permit(:name, :id)
    end
  end
end
