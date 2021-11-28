require "test_helper"

class PostTest < ActiveSupport::TestCase
  test 'valid post' do
    post = Post.new(title: 'Test title', body: 'body', user_id: User.first.id)
    assert post.valid?
  end


  test 'invalid without title' do
    post = Post.new(body: 'body', user_id: User.first.id)
    refute post.valid?, 'post is invalid without title'
  end
end
