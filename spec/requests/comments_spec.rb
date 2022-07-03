require 'rails_helper'

RSpec.describe '/comments', type: :request do
  post = Post.new(  id:1,title:'Test',content:'12345', user:'user1')
   let(:valid_attributes) do
    {
      'id' => 1,
      'content' => 'test content',
      'user' => 'user1',
      'post_id' => post.id
    }
  end
  

   describe 'GET /comments' do
    before do
      Comment.new(valid_attributes)
    end
    it 'get all posts comments' do
      get "/posts/comments/#{post.id}/1"
      expect(response).to be_successful
       hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["data", "loadMore"])
    end
  end
  describe 'POST /comments' do
    # before do
    #   Comment.create(valid_attributes)
    # end
    it 'adds comments' do
      post '/comments', params: { comment:valid_attributes }
      expect(response).to be_successful
       hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["content", "created_at", "id", "post_id", "updated_at", "user"])
    end
  end
describe 'PUT /comments' do
  #  before do
  #     Comment.create(valid_attributes)
  #   end
    let(:new_attributes) do
        {  
          'content' => '12345',
          'user' => "user2"
        }
      end
    it 'updates comments' do
       comment = Comment.new(valid_attributes)
        # comment.save
      patch "/comments/#{comment.id}", params: { comment:new_attributes }
      expect(response).to be_successful
       hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["content", "created_at", "id", "post_id", "updated_at", "user"])
    end
  end
  describe 'DELETE /comments' do
    it 'deletes comments' do
       comment = Comment.new(valid_attributes)
      #  comment.save
      delete "/comments/#{comment.id}"
      expect(response).to be_successful
    end
  end
 
end
