require 'test_helper'

class ShareprojectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shareproject = shareprojects(:one)
  end

  test "should get index" do
    get shareprojects_url, as: :json
    assert_response :success
  end

  test "should create shareproject" do
    assert_difference('Shareproject.count') do
      post shareprojects_url, params: { shareproject: { category: @shareproject.category, comment: @shareproject.comment, creator: @shareproject.creator, description: @shareproject.description, feature_url: @shareproject.feature_url, name: @shareproject.name } }, as: :json
    end

    assert_response 201
  end

  test "should show shareproject" do
    get shareproject_url(@shareproject), as: :json
    assert_response :success
  end

  test "should update shareproject" do
    patch shareproject_url(@shareproject), params: { shareproject: { category: @shareproject.category, comment: @shareproject.comment, creator: @shareproject.creator, description: @shareproject.description, feature_url: @shareproject.feature_url, name: @shareproject.name } }, as: :json
    assert_response 200
  end

  test "should destroy shareproject" do
    assert_difference('Shareproject.count', -1) do
      delete shareproject_url(@shareproject), as: :json
    end

    assert_response 204
  end
end
