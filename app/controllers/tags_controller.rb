class TagsController < ApplicationController
  def index
    @tags = Tag.all
    render :index
  end

  def show
    @tag = Tag.find(params[:id])
    render :show
  end

  def new
    @tag = Tag.new
    render :new
  end

  def create
   @tag = Tag.new(tag_params)
   if @tag.save
     redirect_to  tags_path
   else
     render :new
   end
 end

 private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
