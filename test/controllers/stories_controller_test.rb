require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  setup do
    @story = stories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create story" do
    assert_difference('Storie.count') do
      post :create, story: { category: @story.category, link: @story.link, title: @story.title, upvotes: @story.upvotes }
    end

    assert_redirected_to story_path(assigns(:story))
  end

  test "should show story" do
    get :show, id: @story
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @story
    assert_response :success
  end

  test "should update story" do
    patch :update, id: @story, story: { category: @story.category, link: @story.link, title: @story.title, upvotes: @story.upvotes }
    assert_redirected_to story_path(assigns(:story))
  end

  test "should destroy story" do
    assert_difference('Storie.count', -1) do
      delete :destroy, id: @story
    end

    assert_redirected_to stories_path
  end
end
