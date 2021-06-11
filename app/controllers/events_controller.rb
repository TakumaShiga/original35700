class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  def index
    @events = Event.all.order("created_at DESC")
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
     @event= Event.new(event_params)
     if @event.save
      redirect_to event_path(@event), notice: 'エントリー募集しました'
     else
      flash.now[:alert] = 'エントリー募集ができませんでした'
      render :new
     end
  end

  def edit
  end

  def update
    if @event.update(event_params)
       redirect_to event_path(@event),notice: 'エントリーを編集しました'
    else
       flash.now[:alert] = 'エントリーを編集できませんでした'
       render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'エントリー募集を削除しました'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @event.user_id
      redirect_to root_path
    end 
  end

  def event_params
    params.require(:event).permit(:event_name, :fee, :description, :category_id,
                                  :prefecture_id, :place_number, :place_name,
                                  :event_date, :start_time, :finish_time, :deadline, :image).merge(user_id: current_user.id)
  end
end
