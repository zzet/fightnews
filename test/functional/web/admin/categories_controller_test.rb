require 'test_helper'

class Web::Admin::CategoriesControllerTest < ActionController::TestCase
  def setup
    @category = create :category
    @params = {:id => @category.id}

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
    attrs = attributes_for :category

    post :create, :category => attrs
    assert_response :redirect

    category = Category.last
    assert_equal attrs[:name], category.name
  end

  test "should put update" do
    attrs = {}
    attrs[:name] = generate :name

    put :update, @params.merge(:category => attrs)
    assert_response :redirect

    @category.reload
    assert_equal attrs[:name], @category.name
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect

    category = Category.find_by_id(@params[:id])
    assert_nil category
  end
end
