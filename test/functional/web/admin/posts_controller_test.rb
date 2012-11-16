require 'test_helper'

class Web::Admin::PostsControllerTest < ActionController::TestCase
  def setup
    @post = create :post
    @params = {:id => @post.id}

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
    attrs = attributes_for :post

    post :create, :post => attrs
    assert_response :redirect

    post = Post.last
    assert_equal attrs[:title], post.title
  end

  test "should put update" do
    attrs = {}
    attrs[:title] = generate :title

    put :update, @params.merge(:post => attrs)
    assert_response :redirect

    @post.reload
    assert_equal attrs[:title], @post.title
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect

    post = Post.find_by_id(@params[:id])
    assert_nil post
  end
end
