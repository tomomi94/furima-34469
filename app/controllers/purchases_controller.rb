class PurchasesController < ApplicationController

  def index
    @shipping_address_purchas = ShippingAddressPurchas.new
  end

  def create
  end

end

