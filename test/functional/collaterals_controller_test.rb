require 'test_helper'

class CollateralsControllerTest < ActionController::TestCase
  setup do
    @collateral = collaterals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collaterals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collateral" do
    assert_difference('Collateral.count') do
      post :create, collateral: {  }
    end

    assert_redirected_to collateral_path(assigns(:collateral))
  end

  test "should show collateral" do
    get :show, id: @collateral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @collateral
    assert_response :success
  end

  test "should update collateral" do
    put :update, id: @collateral, collateral: {  }
    assert_redirected_to collateral_path(assigns(:collateral))
  end

  test "should destroy collateral" do
    assert_difference('Collateral.count', -1) do
      delete :destroy, id: @collateral
    end

    assert_redirected_to collaterals_path
  end
end
