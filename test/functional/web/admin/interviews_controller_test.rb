require 'test_helper'

class Web::Admin::InterviewsControllerTest < ActionController::TestCase
  def setup
    @interview = create :interview
    @params = {:id => @interview.id}

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
    attrs = attributes_for :interview

    post :create, :interview => attrs
    assert_response :redirect

    interview = Interview.last
    assert_equal attrs[:title], interview.title
  end

  test "should put update" do
    attrs = {}
    attrs[:title] = generate :title

    put :update, @params.merge(:interview => attrs)
    assert_response :redirect

    @interview.reload
    assert_equal attrs[:title], @interview.title
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect

    interview = Interview.find_by_id(@params[:id])
    assert_nil interview
  end
end
