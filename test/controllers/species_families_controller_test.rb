require 'test_helper'

class SpeciesFamiliesControllerTest < ActionController::TestCase
  setup do
    @species_family = species_families(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:species_families)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create species_family" do
    assert_difference('SpeciesFamily.count') do
      post :create, species_family: { name: @species_family.name }
    end

    assert_redirected_to species_family_path(assigns(:species_family))
  end

  test "should show species_family" do
    get :show, id: @species_family
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @species_family
    assert_response :success
  end

  test "should update species_family" do
    patch :update, id: @species_family, species_family: { name: @species_family.name }
    assert_redirected_to species_family_path(assigns(:species_family))
  end

  test "should destroy species_family" do
    assert_difference('SpeciesFamily.count', -1) do
      delete :destroy, id: @species_family
    end

    assert_redirected_to species_families_path
  end
end
