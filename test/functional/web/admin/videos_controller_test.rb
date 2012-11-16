require 'test_helper'

class Web::Admin::VideosControllerTest < ActionController::TestCase
  def setup
    @video = create :video
    @params = {:id => @video.id}

  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, @params
    assert_response :success
  end

  test "should get create" do
    attrs = attributes_for :video

    post :create, :video => attrs
    assert_response :redirect

    video = Video.last
    assert_equal attrs[:title], video.title
  end

  test "should put update" do
    attrs = {}
    attrs[:title] = generate :title

    put :update, @params.merge(:video => attrs)
    assert_response :redirect

    @video.reload
    assert_equal attrs[:title], @video.title
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect

    video = Video.find_by_id(@params[:id])
    assert_nil video
  end
end
