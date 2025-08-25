class ContainersController < ApplicationController
  def show
    container = params[:id]
    items = Item.where(container: container)
    total_weight = items.sum(:weight)
    render json: { container: container, total_weight: total_weight }
  end

  def items
    container = params[:id]
    items = Item.where(container: container).includes(:item_statuses)
    items_with_status = items.map do |item|
      latest_status = item.item_statuses.order(timestamp: :desc).first
      item.as_json.merge(current_status: latest_status&.status)
    end
    render json: items_with_status
  end
end
