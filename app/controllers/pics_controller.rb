class PicsController < ApplicationController
  before_action :set_pic, only: [:show,:update,:destroy,:edit]
  def index
    @pics = Pic.all.order('created_at DESC')
  end

  def show
  end
  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = current_user.pics.build(pic_params)
    if @pic.save
      redirect_to @pic, notice: "Yes! It was posted!"
    else
      render 'new'
    end

  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: "Pic was updated!"
    else
      render 'edit'
    end

  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end

  def edit

  end

  private 
    def set_pic
      @pic = Pic.find(params[:id])
    end
    def pic_params
      params.require(:pic).permit(:title,:description)
    end
end
