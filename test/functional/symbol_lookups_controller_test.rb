require 'test_helper'

class SymbolLookupsControllerTest < ActionController::TestCase
  setup do
    @symbol_lookup = symbol_lookups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:symbol_lookups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create symbol_lookup" do
    assert_difference('SymbolLookup.count') do
      post :create, symbol_lookup: @symbol_lookup.attributes
    end

    assert_redirected_to symbol_lookup_path(assigns(:symbol_lookup))
  end

  test "should show symbol_lookup" do
    get :show, id: @symbol_lookup.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @symbol_lookup.to_param
    assert_response :success
  end

  test "should update symbol_lookup" do
    put :update, id: @symbol_lookup.to_param, symbol_lookup: @symbol_lookup.attributes
    assert_redirected_to symbol_lookup_path(assigns(:symbol_lookup))
  end

  test "should destroy symbol_lookup" do
    assert_difference('SymbolLookup.count', -1) do
      delete :destroy, id: @symbol_lookup.to_param
    end

    assert_redirected_to symbol_lookups_path
  end
end
