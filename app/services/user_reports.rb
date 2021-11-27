class UserReports
  def self.call
    users = User.select("users.*, COUNT(posts.id) as posts_count")
                .joins(:posts).group('users.id').having('count(posts.id) > 0')

    users.map do |user|
      {
        user_id: user.id,
        number_of_posts: user.posts_count
      }
    end
  end
end
