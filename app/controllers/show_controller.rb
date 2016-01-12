class ShowController < ApplicationController
  # GET /show/alldata
  # GET /show/alldata.json
  def alldata
    projects = Project.where(company_id:current_user.company_id)
    @field_data = FieldDatum.where(project: projects)
    
  end
end
