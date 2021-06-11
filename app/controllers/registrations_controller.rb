class RegistrationsController < ApplicationController
  def index
    @registration = RegistrationAddress.new
  end

  def create
    @registration = RegistrationAddress.new(registration_params)
    @registration.save
  end

  private

  def registration_params
    params.require(:registration_address).permit(:postal_code, :prefecture_id, :city, :place_number, :building_name, :phone_number).merge(user_id: current_user.id, event_id: @event.id, token: params[:token])
end
