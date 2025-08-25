class ContainersController < ApplicationController
  def show
    container = params[:id]
    items = Item.where(container: container)
    total_weight = items.sum(:weight)
    render json: { container: container, total_weight: total_weight }
  end

  def items
    container = params[:id]
    items = Item.where(container: container)
    render json: items
  end
end
