class OrdersController < ApplicationController
    before_action :authenticate_user!


    def index
      @order_form = OrderForm.new
      @item = Item.find(params[:item_id])
      redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
    end

    def create
      @order_form = OrderForm.new(order_params)
      @item = Item.find(params[:item_id])
      redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
      if @order_form.valid?
        pay_item
        @order_form.save
        redirect_to root_path
      else
        render :index
      end
    end   

    private

    def order_params
        params.require(:order_form).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_numder).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end  
    
    def pay_item
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

end
