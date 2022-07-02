
require 'rails_helper'

RSpec.describe Comment, type: :model do
post = Post.first_or_create(title: 'test Body',  content: 'test Body',  user: "test user", )
  it 'has a content' do
    comment = Comment.new(
      content: '',
      user: "test user",
      post_id:post.id,
    )
    expect(comment).to_not be_valid

    comment.content = 'Has a title'
    expect(comment).to be_valid
  end
it 'has a user' do
    comment = Comment.new(
      content: 'test',
      user: "",
      post_id:post.id,
    )
    expect(comment).to_not be_valid

    comment.user = 'user'
    expect(comment).to be_valid
  end
  it 'has a post id' do
    comment = Comment.new(
      content: 'test',
      user: "test user",
      post_id:" ",
    )
    expect(comment).to_not be_valid

    comment.post_id = post.id
    expect(comment).to be_valid
  end

end