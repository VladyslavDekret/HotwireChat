class RoomsController < ApplicationController
  def index
    @new_room = Room.new
    @rooms = Room.all
  end

  def show
    @room = Room.find_by!(title: params[:title])
    @messages = MessageDecorator.decorate_collection(@room.messages.includes(:user))
    @new_message = current_user&.messages&.build(room: @room)
  end

  def create
    @new_room = Room.new(user: current_user)

    @new_room.broadcast_append_to :rooms if @new_room.save
  end
end
