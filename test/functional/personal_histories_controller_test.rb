require 'test_helper'

class PersonalHistoriesControllerTest < ActionController::TestCase
  setup do
    @personal_history = personal_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personal_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create personal_history" do
    assert_difference('PersonalHistory.count') do
      post :create, personal_history: @personal_history.attributes
    end

    assert_redirected_to personal_history_path(assigns(:personal_history))
  end

  test "should show personal_history" do
    get :show, id: @personal_history.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @personal_history.to_param
    assert_response :success
  end

  test "should update personal_history" do
    put :update, id: @personal_history.to_param, personal_history: @personal_history.attributes
    assert_redirected_to personal_history_path(assigns(:personal_history))
  end

  test "should destroy personal_history" do
    assert_difference('PersonalHistory.count', -1) do
      delete :destroy, id: @personal_history.to_param
    end

    assert_redirected_to personal_histories_path
  end
end
