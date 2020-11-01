module V1
  class MastersController < ApplicationController
    def get
    end

    def create
      @master = ::Master.new master_params
      if params[:name].blank?
        render json: { error: "nameを入力してください" }
      end
      if @master.save
        render json: { result: true, message: "masterを作成しました" }
      else
        render json: { result: false, message: "masterの保存に失敗しました。" }
      end
    end

    def edit
    end

    def delete
    end

    def index
      @masters = Master.all
      render json: @masters, each_serializer: MastersSerializer
    end

    private

    def master_params
      params.require(:master).permit(:name, :id)
    end
  end
end