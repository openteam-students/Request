require 'test_helper'

class RequestaControllerTest < ActionController::TestCase
  setup do
    @requestum = requesta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requesta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requestum" do
    assert_difference('Requestum.count') do
      post :create, requestum: { date_time: @requestum.date_time, id_performer: @requestum.id_performer, id_project: @requestum.id_project, id_source: @requestum.id_source, status_request: @requestum.status_request, text: @requestum.text, theme: @requestum.theme }
    end

    assert_redirected_to requestum_path(assigns(:requestum))
  end

  test "should show requestum" do
    get :show, id: @requestum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requestum
    assert_response :success
  end

  test "should update requestum" do
    put :update, id: @requestum, requestum: { date_time: @requestum.date_time, id_performer: @requestum.id_performer, id_project: @requestum.id_project, id_source: @requestum.id_source, status_request: @requestum.status_request, text: @requestum.text, theme: @requestum.theme }
    assert_redirected_to requestum_path(assigns(:requestum))
  end

  test "should destroy requestum" do
    assert_difference('Requestum.count', -1) do
      delete :destroy, id: @requestum
    end

    assert_redirected_to requesta_path
  end
end
