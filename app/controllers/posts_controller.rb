class PostsController < ApplicationController
before_action :set_post, except: [:index, :new, :create]

	def index
		@posts = Post.all
	end

	def show
		
	end
	def new
		@post = Post.new
	end
	def create 
		@post = Post.new(post_params)
		if @post.save
			flash.now[:success] = 'Статья успешно создана'
			redirect_to @post, success: 'Статья успешно создана'
		else
			flash.now[:danger] = 'Статья не создана'
			render :new
		end
	end
	def update
		if @post.update post_params
			flash.now[:success] = 'Статья успешно обновлена'
			redirect_to @post, success: 'Статья успешно обновлена'
		else
			flash.now[:danger] = 'Статья не обновлена'
			render :edit
		end
	end
	def destroy
		@post.destroy
		redirect_to posts_path, info: 'Статья успешно удалена'
	end
	private

	def set_post
		@post = Post.find(params[:id])
	end
	def post_params
		params.require(:post).permit(:title, :body, :image)
	end
end
