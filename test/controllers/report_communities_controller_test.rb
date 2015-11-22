require 'test_helper'

class ReportCommunitiesControllerTest < ActionController::TestCase
  setup do
    @report_community = report_communities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_communities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_community" do
    assert_difference('ReportCommunity.count') do
      post :create, report_community: { community_id: @report_community.community_id, individuals_per_hectare: @report_community.individuals_per_hectare, mean_canopy_diameter: @report_community.mean_canopy_diameter, percentage_cover: @report_community.percentage_cover }
    end

    assert_redirected_to report_community_path(assigns(:report_community))
  end

  test "should show report_community" do
    get :show, id: @report_community
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_community
    assert_response :success
  end

  test "should update report_community" do
    patch :update, id: @report_community, report_community: { community_id: @report_community.community_id, individuals_per_hectare: @report_community.individuals_per_hectare, mean_canopy_diameter: @report_community.mean_canopy_diameter, percentage_cover: @report_community.percentage_cover }
    assert_redirected_to report_community_path(assigns(:report_community))
  end

  test "should destroy report_community" do
    assert_difference('ReportCommunity.count', -1) do
      delete :destroy, id: @report_community
    end

    assert_redirected_to report_communities_path
  end
end
