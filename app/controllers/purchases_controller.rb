class PurchasesController < ApplicationController

  def index
    @shipping_address_purchase = ShippingAddressPurchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @shipping_address_purchase = ShippingAddressPurchase.new(purchas_params)
    if @shipping_address_purchase.valid?
      @shipping_address_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchas_params
    params.require(:shipping_address_purchase).permit(:post_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
