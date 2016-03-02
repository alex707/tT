class WallsController < ApplicationController
  before_action :set_wall, only: :show

  def index
    @walls = Wall.all
  end

  def my_walls
    @walls = Wall.where("user_id = #{current_user.id}")
    render 'my_walls'
  end

  def show
    @posts = Post.where("wall_id = #{@wall.id}").order("id DESC")
  end

  def create
    @wall = Wall.new(wall_params)
    @wall.user_id = current_user.id

    respond_to do |format|
      if @wall.save
        format.html { redirect_to @wall, notice: 'Wall was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def new
    @wall = Wall.new
  end

  private

  def wall_params
    params.require(:wall).permit(:wall_name, :user_id)
  end

  def set_wall
    @wall = Wall.find(params[:id])
  end

end
