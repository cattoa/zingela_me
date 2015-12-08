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
    number_of_sites = 0
    @project.field_datum.each do |field_data|
      number_of_sites = number_of_sites+1
      field_data.observations.each do |observation|
          observation.crown_diameters.each do |crown_diameter|
            mean_canopy_diameter =(crown_diameter.lower_crown_diameter.to_f + crown_diameter.upper_crown_diameter.to_f)/2
          end
          observation.plant_covers.each do |plant_cover|
            percentage_cover = plant_cover.percentage
          end
          CommunityCover.find_or_create_by(observation_id:observation.id) do |community_cover|
            community_cover.species = observation.species
            community_cover.percentage_cover = percentage_cover
            community_cover.mean_canopy_diameter = mean_canopy_diameter
          end
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
