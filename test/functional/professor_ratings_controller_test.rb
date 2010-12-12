require 'test_helper'

class ProfessorRatingsControllerTest < ActionController::TestCase
  setup do
    @professor_rating = professor_ratings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:professor_ratings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create professor_rating" do
    assert_difference('ProfessorRating.count') do
      post :create, :professor_rating => @professor_rating.attributes
    end

    assert_redirected_to professor_rating_path(assigns(:professor_rating))
  end

  test "should show professor_rating" do
    get :show, :id => @professor_rating.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @professor_rating.to_param
    assert_response :success
  end

  test "should update professor_rating" do
    put :update, :id => @professor_rating.to_param, :professor_rating => @professor_rating.attributes
    assert_redirected_to professor_rating_path(assigns(:professor_rating))
  end

  test "should destroy professor_rating" do
    assert_difference('ProfessorRating.count', -1) do
      delete :destroy, :id => @professor_rating.to_param
    end

    assert_redirected_to professor_ratings_path
  end
end
