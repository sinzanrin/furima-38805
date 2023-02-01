class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :together_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.user_id == current_user.id 
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'edit' 
    end   
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :status_id, :shipping_cost_id, :shipping_day_id, :prefecture_id, :category_id, :image).merge(user_id: current_user.id)
  end

  def together_item
    @item = Item.find(params[:id])
  end
end

