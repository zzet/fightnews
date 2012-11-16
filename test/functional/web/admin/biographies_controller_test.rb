require 'test_helper'

class Web::Admin::BiographiesControllerTest < ActionController::TestCase
  def setup
    @biography = create :biography
    @params = {:id => @biography.id}

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
    attrs = attributes_for :biography

    post :create, :biography => attrs
    assert_response :redirect

    biography = Biography.last
    assert_equal attrs[:title], biography.title
  end

  test "should put update" do
    attrs = {}
    attrs[:title] = generate :title

    put :update, @params.merge(:biography => attrs)
    assert_response :redirect

    @biography.reload
    assert_equal attrs[:title], @biography.title
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect

    biography = Biography.find_by_id(@params[:id])
    assert_nil biography
  end
end
