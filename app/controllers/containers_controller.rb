class ContainersController < ApplicationController
  def show
    container_id = params[:id]
    items = Item.where(container_id: container_id)
    total_weight = items.sum(:weight)
    render json: { container_id: container_id, total_weight: total_weight }
  end

  def items
    container_id = params[:id]
    items = Item.where(container_id: container_id)
    render json: items
  end
end
