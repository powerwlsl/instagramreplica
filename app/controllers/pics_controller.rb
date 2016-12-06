class PicsController < ApplicationController
  before_action :set_pic, only: [:show,:update,:destroy,:edit]
  def index
    @pics = Pic.all.order('created_at DESC')
  end

  def show
  end
  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)
    if @pic.save
      redirect_to @pic, notice: "Yes! It was posted!"
    else
      render 'new'
    end

  end

  def update
    
  end

  private 
    def set_pic
      @pic = Pic.find(params[:id])
    end
    def pic_params
      params.require(:pic).permit(:title,:description)
    end
end
