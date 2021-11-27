module Api
  module V1
    class LikesController < Api::V1::BaseController
      def like_on_post
        @post = Post.published.find(params[:post_id])
        @like = @post.likes.find_or_create_by(user_id: current_user.id)

        if @like.persisted?
          render json: { data: @like, message: "Post liked" }, status: :ok
        else
          render json: { data: @like.errors, message: "Errors while like the post"}, status: :unprocessable_entity
        end
      end

      def like_on_comment
        @comment = Comment.find(params[:comment_id])
        @like = @comment.likes.find_or_create_by(user_id: current_user.id)

        if @like.persisted?
          render json: { data: @like, message: "Comment liked" }, status: :ok
        else
          render json: { data: @like.errors, message: "Errors while like the comment"}, status: :unprocessable_entity
        end
      end
    end
  end
end
