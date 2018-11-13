class GiftsController < ApplicationController
  def index
    @gifts = current_user.gifts
    @confirmed = []
    all_confirmed = Reserve.find_by(confirmed: true)
    if all_confirmed != nil
      all_confirmed.each do |reserve|
        @confirmed.push(reserve) if reserve.gift.user == current_user
      end
    end
  end

  def show
    @accessable = false
    @gift = Gift.find_by(id: params[:id])
    @mine = true if @gift.user == current_user
    @accessable = true if current_user.active_relationships.find_by(followed_id: @gift.user.id)
    @reserved = false
    @reserved = true if Reserve.find_by(gift_id: @gift.id)
  end

  def new
    @gift = Gift.new
  end

  def create
    gift = current_user.gifts.create(gifts_params)
    # raise "Some Error"
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
