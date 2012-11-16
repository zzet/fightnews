require 'test_helper'

class Web::Admin::NewsControllerTest < ActionController::TestCase
  def setup
    @news = create :news
    @params = {:id => @news.id}

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

  test "should get show" do
    get :show, @params
    assert_response :success
  end

  test "should get create" do
    attrs = attributes_for :news

    post :create, :news => attrs
    assert_response :redirect

    news = News.last
    assert_equal attrs[:title], news.title
  end

  test "should put update" do
    attrs = {}
    attrs[:title] = generate :title

    put :update, @params.merge(:news => attrs)
    assert_response :redirect

    @news.reload
    assert_equal attrs[:title], @news.title
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect

    news = News.find_by_id(@params[:id])
    assert_nil news
  end
end
