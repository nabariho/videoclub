require 'test_helper'

class CommercialsControllerTest < ActionController::TestCase
  setup do
    @commercial = commercials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commercials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commercial" do
    assert_difference('Commercial.count') do
      post :create, commercial: { name: @commercial.name }
    end

    assert_redirected_to commercial_path(assigns(:commercial))
  end

  test "should show commercial" do
    get :show, id: @commercial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commercial
    assert_response :success
  end

  test "should update commercial" do
    put :update, id: @commercial, commercial: { name: @commercial.name }
    assert_redirected_to commercial_path(assigns(:commercial))
  end

  test "should destroy commercial" do
    assert_difference('Commercial.count', -1) do
      delete :destroy, id: @commercial
    end

    assert_redirected_to commercials_path
  end
end
