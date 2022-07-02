require 'rails_helper'

RSpec.describe '/posts', type: :request do
   let(:valid_attributes) do
    {
      'id' => '1',
      'title' => 'Test',
      'content' => '12345',
      'user' => 'user1'
    }
  end

   describe 'GET /posts' do
    before do
      Post.create(
      title: 'test',
      content: 'test Body',
      user: "test user",)
    end
    it 'get all posts' do
      get '/get-posts/1'
      expect(response).to be_successful
       hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["data", "nextPage", "pageCount", "prePage"])
    end
     it 'get Posts And number of Comments' do
      get '/get-single-posts/1'
      expect(response).to be_successful
       hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["data", "comment"])
    end
  end
  describe 'POST /posts' do
    it 'adds posts' do
      post '/posts', params: { post:valid_attributes }
      expect(response).to be_successful
       hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["content", "created_at", "id", "title", "updated_at", "user"])
    end
  end
describe 'PUT /posts' do
    let(:new_attributes) do
        {
          'id' => '1',
          'title' => 'Test',
          'body' => '12345',
          'user' => "user2"
        }
      end
    it 'updates posts' do
       post = Post.new(valid_attributes)
       # post.save
      patch "/posts/#{post.id}", params: { post:new_attributes }
      expect(response).to be_successful
       hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["content", "created_at", "id", "title", "updated_at", "user"])
    end
  end
  describe 'DELETE /posts' do
    it 'deletes posts' do
       post = Post.new(valid_attributes)
       # post.save
      delete "/posts/#{post.id}"
      expect(response).to be_successful
    end
  end
 
end
