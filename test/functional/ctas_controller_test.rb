require 'test_helper'

class CtasControllerTest < ActionController::TestCase
  setup do
    @cta = ctas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ctas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cta" do
    assert_difference('Cta.count') do
      post :create, cta: { pi_id: @cta.pi_id, workflow_status: @cta.workflow_status }
    end

    assert_redirected_to cta_path(assigns(:cta))
  end

  test "should show cta" do
    get :show, id: @cta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cta
    assert_response :success
  end

  test "should update cta" do
    put :update, id: @cta, cta: { pi_id: @cta.pi_id, workflow_status: @cta.workflow_status }
    assert_redirected_to cta_path(assigns(:cta))
  end

  test "should destroy cta" do
    assert_difference('Cta.count', -1) do
      delete :destroy, id: @cta
    end

    assert_redirected_to ctas_path
  end
end
