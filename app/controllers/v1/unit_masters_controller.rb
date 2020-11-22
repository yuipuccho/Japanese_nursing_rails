module V1
  class UnitMastersController < ApplicationController
    before_action :authenticated!

    # create unit
    # @param auth_token
    # @param japanese
    # @param vietnamese
    def create
      unit_master = UnitMaster.create unit_master_params
      if unit_master.save
        render json: { result: true, message: t('unit_masters.create.success') }
      else
        render json: { result: false, message: t('unit_masters.create.failed') }
      end
    end

    def update
      unit_master = UnitMaster.find(params[:id])
      unit_master.update! unit_master_params
      render json: { result: true, message: t('unit_masters.update.success')}
    rescue StandardError
      render json: { result: false, message: t('apis.update_record_not_found') }
    end

    private

    def unit_master_params
      params.permit(:japanese, :vietnamese)
    end
  end
end
