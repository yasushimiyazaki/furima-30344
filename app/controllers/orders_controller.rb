class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]

  def index
    @buy = Buy.new
    order_present
  end

  def create
    @buy = Buy.new(buy_params)
    order_present
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy).permit(:price, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user.id == @item.user.id
  end

  def order_present
    redirect_to root_path if @item.order.present?
  end
end
