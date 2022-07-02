
require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'has a title' do
    post = Post.new(
      title: '',
      content: 'test Body',
      user: "test user",
    )
    expect(post).to_not be_valid

    post.title = 'Has a title'
    expect(post).to be_valid
  end
  it 'has a content' do
    post = Post.new(
      title: 'test title',
      content: '',
      user: "test user",
    )
    expect(post).to_not be_valid

    post.content = 'Has a Body'
    expect(post).to be_valid
  end
  it 'has a title' do
    post = Post.new(
      title: 'test title',
      content: 'test Body',
      user: " ",
    )
    expect(post).to_not be_valid

    post.user = 'user'
    expect(post).to be_valid
  end

end