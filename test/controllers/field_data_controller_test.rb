require 'test_helper'

class FieldDataControllerTest < ActionController::TestCase
  setup do
    @field_datum = field_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:field_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create field_datum" do
    assert_difference('FieldDatum.count') do
      post :create, field_datum: { date: @field_datum.date, habitat_description: @field_datum.habitat_description, latitude_degree: @field_datum.latitude_degree, latitude_minutes: @field_datum.latitude_minutes, latitude_seconds: @field_datum.latitude_seconds, location_id: @field_datum.location_id, longitude_degree: @field_datum.longitude_degree, longitude_minutes: @field_datum.longitude_minutes, longitude_seconds: @field_datum.longitude_seconds, project_id: @field_datum.project_id, user_id: @field_datum.user_id }
    end

    assert_redirected_to field_datum_path(assigns(:field_datum))
  end

  test "should show field_datum" do
    get :show, id: @field_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @field_datum
    assert_response :success
  end

  test "should update field_datum" do
    patch :update, id: @field_datum, field_datum: { date: @field_datum.date, habitat_description: @field_datum.habitat_description, latitude_degree: @field_datum.latitude_degree, latitude_minutes: @field_datum.latitude_minutes, latitude_seconds: @field_datum.latitude_seconds, location_id: @field_datum.location_id, longitude_degree: @field_datum.longitude_degree, longitude_minutes: @field_datum.longitude_minutes, longitude_seconds: @field_datum.longitude_seconds, project_id: @field_datum.project_id, user_id: @field_datum.user_id }
    assert_redirected_to field_datum_path(assigns(:field_datum))
  end

  test "should destroy field_datum" do
    assert_difference('FieldDatum.count', -1) do
      delete :destroy, id: @field_datum
    end

    assert_redirected_to field_data_path
  end
end
