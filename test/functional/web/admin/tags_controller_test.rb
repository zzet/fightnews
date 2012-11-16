require 'test_helper'

class Web::Admin::TagsControllerTest < ActionController::TestCase
  def setup
    @tag = create :tag
    @params = {:id => @tag.id}

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
    attrs = attributes_for :tag

    post :create, :tag => attrs
    assert_response :redirect

    tag = Tag.last
    assert_equal attrs[:name], tag.name
  end

  test "should put update" do
    attrs = {}
    attrs[:name] = generate :name

    put :update, @params.merge(:tag => attrs)
    assert_response :redirect

    @tag.reload
    assert_equal attrs[:name], @tag.name
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect

    tag = Tag.find_by_id(@params[:id])
    assert_nil tag
  end
end
