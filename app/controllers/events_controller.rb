class EventsController < ApplicationController
  before_action :set_beginning_of_week
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_event, only:[:show, :confirm, :edit, :update]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event.user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events.includes(:user)
  end

  def confirm
  end

  def edit
    if @event.user == current_user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event.user.id)
    else
      render :edit
    end
  end

  def set_event
    @event = Event.find(params[:id])
  end

  private

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

  def event_params
    params.require(:event).permit(:title, :start_time, :finish_time, :contents).merge(user_id: current_user.id)
  end
end
