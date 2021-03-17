class PurchasesController < ApplicationController

  def index
    @shipping_address_purchas = ShippingAddressPurchas.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @shipping_address_purchas = ShippingAddressPurchas.new(purchas_params)
    if @shipping_address_purchas.valid?
      @shipping_address_purchas.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchas_params
    params.require(:shipping_address_purchas).permit(:post_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
