class PostsController < ApplicationController
def index
	@posts = Post.all
	@post = Post.new
end

def new
	@post = Post.new
end
 def create
    # ストロングパラメーターを使用
     @post = Post.new(post_params)
    # DBへ保存する
    if @post.save
        flash[:notice] = "Books was succesfully created."
        redirect_to '/posts'
    else
        @posts = Post.all
        render 'index'
    end
end

def show
	@post = Post.find(params[:id])
end

def edit
	@post = Post.find(params[:id])
end

def update
	post = Post.find(params[:id])
	if post.update(post_params)
	flash[:notice] = "Books was succesfully updated."
	redirect_to post_path(post)
end
end
def destroy
    post = Post.find(params[:id])
    if post.destroy
    flash[:notice] = "Books was succesfully deleted."
	redirect_to posts_path
end
end
	private

    def post_params
        params.require(:post).permit(:title, :body)
    end
end