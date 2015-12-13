class ReportsController < ApplicationController
  before_action :set_welcome, only: [:show, :edit, :update, :destroy]
  before_filter :deny_to_visitors

  def new_project_report
    @project_report = ProjectReport.new
  end

  def create_project_report
    @project = Project.find(project_report_params[:project_id])
    respond_to do |format|
      format.html
      format.pdf { render :create_project_report => PDFKit.new( post_url(@post) ).to_pdf }
    end
  end
  def root
    redirect_to root_path
  end
  def new_community_cover_report
    @project_report = ProjectReport.new
  end

  def create_community_cover_report
    @project = Project.find(project_report_params[:project_id])
    #------------------------------------
    # DELETE OLD REPORT COMMUNITIES
    @project.field_datum.each do |field_data|
      field_data.community.report_communities.each do |report_community|
          report_community.delete
      end
    end
    # DELETE OLD REPORT COMMUNITIES
    #------------------------------------
    @project.field_datum.each do |field_data|
      report_community = ReportCommunity.find_or_create_by(community:field_data.community)
      field_data.observations.each do |observation|
        percentage_cover = 0
        mean_canopy_diameter = 0
        description = ''
        observation.crown_diameters.each do |crown_diameter|
          mean_canopy_diameter =(crown_diameter.lower_crown_diameter.to_f + crown_diameter.upper_crown_diameter.to_f)/2
        end
        observation.plant_covers.each do |plant_cover|
          percentage_cover = plant_cover.percentage
        end
        observation.growth_forms.each do |growth_form|
          description = growth_form.code
        end
        mean_canopy_diameter = mean_canopy_diameter.to_f/@project.field_datum.count
        percentage_cover = percentage_cover.to_f/@project.field_datum.count
        community_growth_form = CommunityGrowthForm.find_or_create_by(description:description,report_community:report_community)
        CommunityCover.find_or_create_by(species:observation.species,community_growth_form:community_growth_form) do |community_cover|
          community_cover.species = observation.species
          community_cover.percentage_cover = percentage_cover
          community_cover.mean_canopy_diameter = mean_canopy_diameter
        end
        puts "Percentage: #{percentage_cover}"
        puts "Mean Canopy Diameter: #{mean_canopy_diameter}"
      end
    end

  end

protected
  def project_report_params
    params.require(:project_report).permit(:project_id)
  end
private
  def deny_to_visitors
    if admin_signed_in? and company_signed_in?
      sign_out :company
    end
    if admin_signed_in? and user_signed_in?
      sign_out :user
    end
    if company_signed_in? and user_signed_in?
      sign_out :user
    end
    redirect_to new_user_session_path unless user_signed_in?
  end
end
