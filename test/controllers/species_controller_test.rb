require 'test_helper'

class SpeciesControllerTest < ActionController::TestCase
  setup do
    @species = species(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:species)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create species" do
    assert_difference('Species.count') do
      post :create, species: { common_name: @species.common_name, distribution: @species.distribution, growth_forms: @species.growth_forms, life_cycle: @species.life_cycle, max_altitude: @species.max_altitude, max_height: @species.max_height, min_altitude: @species.min_altitude, min_hieght: @species.min_hieght, name: @species.name, potential_biomass: @species.potential_biomass, sa_endemic: @species.sa_endemic, species: @species.species, sysnonym_of: @species.sysnonym_of, threat_status: @species.threat_status }
    end

    assert_redirected_to species_path(assigns(:species))
  end

  test "should show species" do
    get :show, id: @species
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @species
    assert_response :success
  end

  test "should update species" do
    patch :update, id: @species, species: { common_name: @species.common_name, distribution: @species.distribution, growth_forms: @species.growth_forms, life_cycle: @species.life_cycle, max_altitude: @species.max_altitude, max_height: @species.max_height, min_altitude: @species.min_altitude, min_hieght: @species.min_hieght, name: @species.name, potential_biomass: @species.potential_biomass, sa_endemic: @species.sa_endemic, species: @species.species, sysnonym_of: @species.sysnonym_of, threat_status: @species.threat_status }
    assert_redirected_to species_path(assigns(:species))
  end

  test "should destroy species" do
    assert_difference('Species.count', -1) do
      delete :destroy, id: @species
    end

    assert_redirected_to species_index_path
  end
end
