class GiftsController < ApplicationController
  def index
    @gifts = current_user.gifts
  end

  def show
    @gift = current_user.gifts.find_by(id: params[:id])
  end

  def new
    @gift = Gift.new
  end

  def create
    gift = current_user.gifts.create(gifts_params)
    redirect_to gift
  end

  def destroy
    gift = current_user.gifts.find_by(id: params[:id])
    gift.destroy
    redirect_to gifts_path
  end

  def edit
    @gift = current_user.gifts.find_by(id: params[:id])
  end

  def update
    gift = current_user.gifts.find_by(id: params[:id])
    gift.update(gifts_params)
    redirect_to gift
  end

  private

  def gifts_params
    params.require(:gift).permit(:title, :description, :link)
  end
end
