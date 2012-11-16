require 'test_helper'

class Web::Admin::UsersControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    @params = {:id => @user.id}

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
    attrs = attributes_for :user

    post :create, :user => attrs
    assert_response :redirect

    user = User.last
    assert_equal attrs[:nickname], user.nickname
  end

  test "should put update" do
    attrs = {}
    attrs[:nickname] = generate :name

    put :update, @params.merge(:user => attrs)
    assert_response :redirect

    @user.reload
    assert_equal attrs[:nickname], @user.nickname
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect

    user = User.find_by_id(@params[:id])
    assert_nil user
  end
end
