class ItemsController < ApplicationController
before_action:authenticate_user!, only: [:new]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
