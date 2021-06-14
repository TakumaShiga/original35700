class RegistrationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_params
  before_action :prohibit_access

  def index
    @registration_address = RegistrationAddress.new
  end

  def create
    @registration_address = RegistrationAddress.new(registration_params)
    if @registration_address.valid?
      pay_event
      @registration_address.save
      redirect_to root_path, notice: "エントリー及び決済が完了しました"
    else
      flash.now[:alert] = "エントリーに失敗しました"
      render :index
    end
  end


  private

  def set_event_params
    @event = Event.find(params[:event_id])
  end

  def prohibit_access
    if current_user.id == @event.user_id
      redirect_to root_path, notice: '権限がありません'
    end
  end

  def registration_params
    params.require(:registration_address).permit(:postal_code, :prefecture_id, :city, :place_number, :building_name, :phone_number).merge(user_id: current_user.id, event_id: @event.id, token: params[:token])
  end

  def pay_event
    Payjp::api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @event.fee,
        card: registration_params[:token],
        currency: 'jpy'
      )
  end
end
