require 'test_helper'

class AktorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aktors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aktor" do
    assert_difference('Aktor.count') do
      post :create, :aktor => { }
    end

    assert_redirected_to aktor_path(assigns(:aktor))
  end

  test "should show aktor" do
    get :show, :id => aktors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => aktors(:one).to_param
    assert_response :success
  end

  test "should update aktor" do
    put :update, :id => aktors(:one).to_param, :aktor => { }
    assert_redirected_to aktor_path(assigns(:aktor))
  end

  test "should destroy aktor" do
    assert_difference('Aktor.count', -1) do
      delete :destroy, :id => aktors(:one).to_param
    end

    assert_redirected_to aktors_path
  end
end
