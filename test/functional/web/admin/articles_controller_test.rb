require 'test_helper'

class Web::Admin::ArticlesControllerTest < ActionController::TestCase
  def setup
    @article = create :article
    @params = {:id => @article.id}

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
    attrs = attributes_for :article

    post :create, :article => attrs
    assert_response :redirect

    article = Article.last
    assert_equal attrs[:title], article.title
  end

  test "should put update" do
    attrs = {}
    attrs[:title] = generate :title

    put :update, @params.merge(:article => attrs)
    assert_response :redirect

    @article.reload
    assert_equal attrs[:title], @article.title
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect

    article = Article.find_by_id(@params[:id])
    assert_nil article
  end
end
