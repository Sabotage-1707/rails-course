class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_item , only: %i[show destroy edit update upvote]
  before_action :find_seller_of_item , only: %i[show edit update]

  def index
    @items = Item.all.order('id')
  end

  def create
    item = Item.create(items_params)
    if item.persisted?
      redirect_to items_path
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def show

    #render body:'Page not found', status: 404  unless @item
  end

  def new;
    @sellers = Seller.all
  end

  def upvote
    @item.increment!(:votes)
    redirect_to items_path
  end

  def expensive
    @items = Item.where('price > 50')
    render :index
  end

  def destroy
    if @item.destroy.destroyed?
      redirect_to items_path
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def edit
    @sellers = Seller.all
    #render body:'Page not found', status: 404  unless @item
  end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end
  private
  #items_params.permit(:name, :description, :price, :real, :weight)
  def items_params
    params.permit(:name, :price, :seller_id, :description)
  end
  def find_seller_of_item
    @seller = Seller.where("id = #{@item.seller_id}").first
  end
  def find_item

    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

end
