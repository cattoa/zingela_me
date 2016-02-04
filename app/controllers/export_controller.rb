class ExportController < ApplicationController
  before_action :set_field_data, only: [:show, :edit, :update, :destroy]
  before_filter :deny_to_visitors

def export_companies
  @companies = Company.all()
end

def export_field_data
  @field_data = FieldDatum.all()
end

def export_projects
  @project_data = Project.all()
end

def export_crown_diameter
  @crown_diameters = CrownDiameter.all()
end

def export_growth_forms
  @growth_forms = GrowthForm.all()
end

def export_observations
  @observations = Observation.all()
end

def export_plant_cover
  @plant_covers = PlantCover.all()
end

protected
  def export_params
    params.require(:project_report).permit(:community_id)
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
