class ContainersController < ApplicationController
  def show
    container_obj = Container.find(params[:id])
    items = container_obj.items
    total_weight = items.sum(:weight)
    render json: { id: container_obj.id, name: container_obj.name, total_weight: total_weight }
  end

  def items
    container_obj = Container.find(params[:id])
    items = container_obj.items.includes(:item_statuses)
    items_with_status = items.map do |item|
      latest_status = item.item_statuses.order(timestamp: :desc).first
      item.as_json.merge(current_status: latest_status&.status)
    end
    render json: items_with_status
  end
end
