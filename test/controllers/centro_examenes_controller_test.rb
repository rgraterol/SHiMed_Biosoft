require 'test_helper'

class CentroExamenesControllerTest < ActionController::TestCase
  setup do
    @centro_examenes = centro_examenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:centros_examenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create centro_examene" do
    assert_difference('CentroExamene.count') do
      post :create, centro_examenes: {  }
    end

    assert_redirected_to centro_examene_path(assigns(:centro_examenes))
  end

  test "should show centro_examene" do
    get :show, id: @centro_examenes
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @centro_examenes
    assert_response :success
  end

  test "should update centro_examene" do
    patch :update, id: @centro_examenes, centro_examenes: {  }
    assert_redirected_to centro_examene_path(assigns(:centro_examenes))
  end

  test "should destroy centro_examene" do
    assert_difference('CentroExamene.count', -1) do
      delete :destroy, id: @centro_examenes
    end

    assert_redirected_to centro_examenes_path
  end
end
