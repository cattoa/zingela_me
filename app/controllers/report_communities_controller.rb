class ReportCommunitiesController < ApplicationController
  before_action :set_report_community, only: [:show, :edit, :update, :destroy]
  before_action :deny_to_admins_and_companies

  # GET /report_communities
  # GET /report_communities.json
  def index
    projects = Project.where(company_id:current_user.company_id)
    communities = Community.where(project:projects)
    @report_communities = ReportCommunity.where(community:communities)
  end

  # GET /report_communities/1
  # GET /report_communities/1.json
  def show
  end

  # GET /report_communities/new
  def new
    @report_community = ReportCommunity.new
  end

  # GET /report_communities/1/edit
  def edit
  end

  # POST /report_communities
  # POST /report_communities.json
  def create
    @report_community = ReportCommunity.new(report_community_params)

    respond_to do |format|
      if @report_community.save
        format.html { redirect_to @report_community, notice: 'Report community was successfully created.' }
        format.json { render :show, status: :created, location: @report_community }
      else
        format.html { render :new }
        format.json { render json: @report_community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_communities/1
  # PATCH/PUT /report_communities/1.json
  def update
    respond_to do |format|
      if @report_community.update(report_community_params)
        format.html { redirect_to @report_community, notice: 'Report community was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_community }
      else
        format.html { render :edit }
        format.json { render json: @report_community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_communities/1
  # DELETE /report_communities/1.json
  def destroy
    @report_community.destroy
    respond_to do |format|
      format.html { redirect_to report_communities_url, notice: 'Report community was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_community
      @report_community = ReportCommunity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_community_params
      params.require(:report_community).permit(:percentage_cover, :mean_canopy_diameter, :individuals_per_hectare, :community_id)
    end
    def deny_to_admins_and_companies
      redirect_to new_user_session_path unless user_signed_in?
    end
end
