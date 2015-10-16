class PostsController < ApplicationController

  def show
    @tag = Tag.find(params[:tag_id])
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @tag = Tag.find(params[:tag_id])
    @post = @tag.posts.new
  end

  def create
     @tag = Tag.find(params[:tag_id])
     @post = @tag.posts.new(post_params)
     if @post.save
       flash[:notice] = "Post successfully added!"
       redirect_to tag_path(@post.tag)
     else
       render :new
     end
   end

 def edit
    @tag = Tag.find(params[:tag_id])
    @post = Post.find(params[:id])
    render :edit
  end

 def update
   @tag = Tag.find(params[:tag_id])
   @post= Post.find(params[:id])
   if @post.update(post_params)
     redirect_to tag_path(params[:tag_id])
   else
     render :edit
   end
 end

 def destroy
   @post = Post.find(params[:id])
   @post.destroy
   redirect_to tag_path(params[:tag_id])
 end


 private
  def post_params
    params.require(:post).permit(:title, :author, :body)
  end
end
