class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_item , only: %i[show destroy edit update upvote]
  before_action :find_seller_of_item , only: %i[show edit update]

  def index
    @items = Item.all.sort
    @items = Item.where("price >= ?",params[:price_from] ) if params[:price_from]
    @items = @items.where("votes" =>  [2..5]) if params[:votes]

  end

  def create

    item = Item.create(items_params)
    if item.persisted?
      flash[:success]='Item was successful created'
      redirect_to items_path
    else
      flash[:error] = 'Please fill all fields correctly'
      redirect_to new_item_path
    end
  end

  def show

  end

  def new;
    @sellers = Seller.all
    @item = Item.new
  end

  def upvote
    @item.increment!(:votes)
    redirect_to items_path
  end

  def expensive
    @items = Item.where('price > 12000')
    render :index
  end

  def destroy
    if @item.destroy.destroyed?
      flash[:success]='Item was successful deleted'
      redirect_to items_path
    else
      flash.now[:error] = "Item wasn't  deleted"
      redirect_to items_path
    end
  end

  def edit
    @sellers = Seller.all

  end

  def update
    if @item.update(items_params)
      flash[:success]='Item was successful updated'
      redirect_to item_path
    else
      flash.now[:error]="Item wasn't updated"
      render json: item.errors, status: :unprocessable_entity
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :price, :description, :seller_id)
  end

  def find_seller_of_item
    @seller = Seller.where("id = #{@item.seller_id}").first
  end

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

end
