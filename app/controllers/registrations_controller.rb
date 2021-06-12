class RegistrationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_params
  before_action :prohibit_access


  def index
    @registration = RegistrationAddress.new
  end

  def confirm
    @registration = Registration.new(registration_params)
    render :index if @registration.invalid?
  end

  def show
    @registration = RegistrationAddress.find_by(event_id: @event.id, id: params[:id])
  end

  def create
    @registration = RegistrationAddress.new(registration_params)
    if @registration.valid?
      pay_event
      
      @registration.save
      return redirect_to root_path, notice: "エントリー及び決済が完了しました"
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
      redirect_to root_path
    end
  end

  def registration_params
    params.require(:registration_address).permit(:postal_code, :prefecture_id, :city, :place_number, :building_name, :phone_number).merge(user_id: current_user.id, event_id: @event.id, token: params[:token])
  end

  def pay_event
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: registration_params[:fee]
        card: registration_params[:token]
        currency: 'jpy'
      )
  end
end
