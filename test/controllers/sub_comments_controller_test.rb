require "test_helper"

class SubCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_comment = sub_comments(:one)
  end

  test "should get index" do
    get sub_comments_url, as: :json
    assert_response :success
  end

  test "should create sub_comment" do
    assert_difference("SubComment.count") do
      post sub_comments_url, params: { sub_comment: { content: @sub_comment.content, user: @sub_comment.user,comment: @sub_comment.comment_id  } }, as: :json
    end

    assert_response :created
  end

  test "should show sub_comment" do
    get sub_comment_url(@sub_comment), as: :json
    assert_response :success
  end

  test "should update sub_comment" do
    patch sub_comment_url(@sub_comment), params: { sub_comment: { content: @sub_comment.content, user: @sub_comment.user } }, as: :json
    assert_response :success
  end

 test "should get sub comments in comments" do
    get sub_comment_url(@sub_comment), as: :json
    assert_response :success
  end
  test "should destroy sub_comment" do
    assert_difference("SubComment.count", -1) do
      delete sub_comment_url(@sub_comment), as: :json
    end

    assert_response :no_content
  end
end
