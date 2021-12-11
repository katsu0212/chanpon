class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update]

  def index
      @room_lists = Room.all
      @room_joining = RoomUser.where(user_id: current_user.id)
      @room_lists_none = "グループに参加していません。"
  end

  def new
      @room = Room.new
      @room.users << current_user
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: 'グループを作成しました。'
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_path, notice: 'グループを更新しました。'
    else
      render :edit
    end
  end

  def destroy
      delete_room = Room.find(params[:id])
      if delete_room.destroy
          redirect_to rooms_path, notice: 'グループを削除しました。'
      end
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end

end
