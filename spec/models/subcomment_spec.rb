
require 'rails_helper'

RSpec.describe SubComment, type: :model do
post = Post.first_or_create(title: 'test Body',  content: 'test Body',  user: "test user", )
comment = Comment.first_or_create( content: 'test Body',  user: "test user", post_id: post.id)
  it 'has a content' do
    subcomment = SubComment.new(
      content: '',
      user: "test user",
      comment_id:comment.id,
    )
    expect(subcomment).to_not be_valid

    subcomment.content = 'Has a title'
    expect(subcomment).to be_valid
  end
it 'has a user' do
    subcomment = SubComment.new(
      content: 'test',
      user: "",
      comment_id:comment.id,
    )
    expect(subcomment).to_not be_valid

    subcomment.user = 'user'
    expect(subcomment).to be_valid
  end
  it 'has a comment id' do
    subcomment = SubComment.new(
      content: 'test',
      user: "test user",
      comment_id:'',
    )
    expect(subcomment).to_not be_valid

    subcomment.comment_id = comment.id
    expect(subcomment).to be_valid
  end

end