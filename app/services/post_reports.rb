class PostReports
  def self.call
    posts = Post.includes(:likes)
                .select("posts.*, COUNT(comments.id) AS comments_count")
                .joins(:comments)
                .group("posts.id")

    posts.map do |post|
      {
        post_id: post.id,
        comment_count: post.comments_count,
        likes_count: post.likes.length
      }
    end
  end
end
