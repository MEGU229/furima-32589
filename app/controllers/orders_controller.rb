class OrdersController < ApplicationController
  before_action :set, only: [:index, :create]

  def index
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def form_params
    params.require(:form).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: form_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set
    @item = Item.find(params[:item_id])
  end

end
