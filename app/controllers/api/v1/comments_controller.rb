module Api
  module V1
    class CommentsController < Api::V1::BaseController
      def create
        @post = Post.published.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.user = current_user

        if @comment.save
          render json: { data: @comment, message: "Comment created" }, status: :ok
        else
          render json: { data: @comment.errors, message: "Errors while commenting on post"}, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:body)
      end
    end
  end
end
