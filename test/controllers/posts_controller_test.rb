class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @token = User.first.jwt_token
  end

  test "should get index" do
    get api_v1_posts_path, headers: { "Authorization" => @token }
    assert_response :success
  end

  test "should show post" do
    get api_v1_posts_path, headers: { "Authorization" => @token }
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post api_v1_posts_path, headers: { "Authorization" => @token },
                              params: {
                                post: { title: "Test Post", body: "Test body"}
                              },
                              as: :json
    end
  end
end

