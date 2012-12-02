require 'test_helper'

class CtaControllerTest < ActionController::TestCase
  setup do
    @ctum = cta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ctum" do
    assert_difference('Ctum.count') do
      post :create, ctum: { pi_id: @ctum.pi_id, workflow_status: @ctum.workflow_status }
    end

    assert_redirected_to ctum_path(assigns(:ctum))
  end

  test "should show ctum" do
    get :show, id: @ctum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ctum
    assert_response :success
  end

  test "should update ctum" do
    put :update, id: @ctum, ctum: { pi_id: @ctum.pi_id, workflow_status: @ctum.workflow_status }
    assert_redirected_to ctum_path(assigns(:ctum))
  end

  test "should destroy ctum" do
    assert_difference('Ctum.count', -1) do
      delete :destroy, id: @ctum
    end

    assert_redirected_to cta_path
  end
end
