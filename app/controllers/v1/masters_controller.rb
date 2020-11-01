module V1
  class MastersController < ApplicationController
    def new

    end

    def edit
    end

    def delete
    end

    def index
      @masters = Master.all
      render json: @masters, each_serializer: MastersSerializer
    end
  end
end
