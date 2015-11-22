require 'test_helper'

class CommunityGrowthFormsControllerTest < ActionController::TestCase
  setup do
    @community_growth_form = community_growth_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:community_growth_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create community_growth_form" do
    assert_difference('CommunityGrowthForm.count') do
      post :create, community_growth_form: { count: @community_growth_form.count, description: @community_growth_form.description, has_normal_competitor: @community_growth_form.has_normal_competitor, has_strong_competitor: @community_growth_form.has_strong_competitor, has_weak_competitor: @community_growth_form.has_weak_competitor, individuals_per_hectare: @community_growth_form.individuals_per_hectare, intercept: @community_growth_form.intercept, mean_canopy_diameter: @community_growth_form.mean_canopy_diameter, occurance_mean: @community_growth_form.occurance_mean, percentage_cover: @community_growth_form.percentage_cover, percentage_cover_mean: @community_growth_form.percentage_cover_mean, proportional_cover: @community_growth_form.proportional_cover, slope: @community_growth_form.slope, std_deviation: @community_growth_form.std_deviation, std_error: @community_growth_form.std_error }
    end

    assert_redirected_to community_growth_form_path(assigns(:community_growth_form))
  end

  test "should show community_growth_form" do
    get :show, id: @community_growth_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @community_growth_form
    assert_response :success
  end

  test "should update community_growth_form" do
    patch :update, id: @community_growth_form, community_growth_form: { count: @community_growth_form.count, description: @community_growth_form.description, has_normal_competitor: @community_growth_form.has_normal_competitor, has_strong_competitor: @community_growth_form.has_strong_competitor, has_weak_competitor: @community_growth_form.has_weak_competitor, individuals_per_hectare: @community_growth_form.individuals_per_hectare, intercept: @community_growth_form.intercept, mean_canopy_diameter: @community_growth_form.mean_canopy_diameter, occurance_mean: @community_growth_form.occurance_mean, percentage_cover: @community_growth_form.percentage_cover, percentage_cover_mean: @community_growth_form.percentage_cover_mean, proportional_cover: @community_growth_form.proportional_cover, slope: @community_growth_form.slope, std_deviation: @community_growth_form.std_deviation, std_error: @community_growth_form.std_error }
    assert_redirected_to community_growth_form_path(assigns(:community_growth_form))
  end

  test "should destroy community_growth_form" do
    assert_difference('CommunityGrowthForm.count', -1) do
      delete :destroy, id: @community_growth_form
    end

    assert_redirected_to community_growth_forms_path
  end
end
