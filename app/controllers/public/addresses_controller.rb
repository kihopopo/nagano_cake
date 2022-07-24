class Public::AddressesController < ApplicationController
  def index
   @address = Address.all
  end

  def edit
  end
end
