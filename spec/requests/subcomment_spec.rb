require 'rails_helper'

RSpec.describe '/sub_comments', type: :request do
  post = Post.new(  id:1,title:'Test',content:'12345', user:'user1')
  comment = Comment.new(  id:1,post_id:post.id,content:'12345', user:'user1')
   let(:valid_attributes) do
    {
      'id' => '1',
      'content' => 'test content',
      'user' => 'user1',
      'comment_id' => comment.id
    }
  end

   describe 'GET /SubComment' do
    before do
      SubComment.create(valid_attributes)
    end
    it 'get all comments sub comments' do
      get "/comments/sub-comments/#{comment.id}/1"
      expect(response).to be_successful
       hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["data", "loadMore"])
    end
  end
  describe 'POST /SubComment' do
    before do
      SubComment.create(valid_attributes)
    end
    it 'adds sub-comments' do
      post '/sub_comments', params: { sub_comment:valid_attributes }
      expect(response).to be_successful
       hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["content", "created_at", "id", "comment_id", "updated_at", "user"])
    end
  end
describe 'PUT /SubComment' do
   before do
      SubComment.create(valid_attributes)
    end
    let(:new_attributes) do
        {  
          'id' =>1,
          'content' => '12345',
          'user' => "user2"
        }
      end
    it 'updates SubComment' do
       subcomment = SubComment.new(valid_attributes)
       # subcomment.save
      patch "/sub_comments/#{subcomment.id}", params: { sub_comment:new_attributes }
      expect(response).to be_successful
       hash_body = nil
      expect { hash_body = JSON.parse(response.body).with_indifferent_access }.not_to raise_exception
      expect(hash_body.keys).to match_array(["content", "created_at", "id", "comment_id", "updated_at", "user"])
    end
  end
  describe 'DELETE /SubComment' do
    it 'deletes SubComment' do
       subcomment = SubComment.create(valid_attributes)
       # subcomment.save
      delete "/sub_comments/#{comment.id}"
      expect(response).to be_successful
    end
  end
 
end
