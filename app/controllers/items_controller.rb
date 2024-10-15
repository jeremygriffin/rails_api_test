class ItemsController < ApplicationController
   def index
        @itemItems = Item.all
        render json: @itemItems
    end

    def show
        @itemItem = Item.find(params[:id])
        render json: @itemItem
    end

    def create
        @itemItem = Item.create(
            name: params[:name],
            weight: params[:weight],
            container: params[:container]
        )
        render json: @itemItem
    end

    def update
        @itemItem = Item.find(params[:id])
        @itemItem.update(
            name: params[:name],
            weight: params[:weight],
            container: params[:container]
        )
        render json: @itemItem
    end

    def destroy
        @itemItems = Item.all
        @itemItem = Item.find(params[:id])
        @itemItem.destroy
        render json: @itemItems
    end
end
