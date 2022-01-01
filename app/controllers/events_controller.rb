class EventsController < ApplicationController
  before_action :set_beginning_of_week

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if params[:back]
      render :new
    else @event.save
      redirect_to event_path(@event.user.id)
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(params[:id])
    @events = @user.events.includes(:user)
  end

  def confirm
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event.user.id)
    else
      render :edit
    end
  end

  private

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

  def event_params
    params.require(:event).permit(:title, :start_time, :finish_time, :contents).merge(user_id: current_user.id)
  end
end
