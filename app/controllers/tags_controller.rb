class TagsController < ApplicationController
  def index
    @tags = Tag.all
    render :index
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
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

 def edit
    @tag = Tag.find(params[:id])
    render :edit
  end

 def update
   @tag= Tag.find(params[:id])
   if @tag.update(tag_params)
     redirect_to tags_path
   else
     render :edit
   end
 end

 def destroy
   @tag = Tag.find(params[:id])
   @tag.destroy
   redirect_to tags_path
 end


 private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
