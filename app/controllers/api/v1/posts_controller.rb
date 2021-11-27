module Api
  module V1
    class PostsController < Api::V1::BaseController
      before_action :find_post, only: [:show, :update]

      # If time permits will user pagination here
      def index
        @posts = Post.all

        render json: @posts
      end

      def show
      end

      def create
        @post = current_user.posts.new(post_params)

        if @post.save
          render json: { data: @post, message: "Post created" }, status: :ok
        else
          render json: { data: @post.errors, message: "Errors while creating post"}, status: :unprocessable_entity
        end
      end

      def update
      end

      private

      def post_params
        params.require(:post).permit(:title, :body, :status)
      end

      def find_post
        @post = current_user.posts.find_by(id: params[:id])
      end
    end
  end
end
