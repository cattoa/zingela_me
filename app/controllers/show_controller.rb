class ShowController < ApplicationController
  before_action :set_field_data, only: [:show, :edit, :update, :destroy]
  # GET /show/alldata
  # GET /show/alldata.json
  def alldata


  end

  def all_field_data
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @article }
    end
  end

  def set_field_data
    projects = Project.where(company_id:current_user.company_id)
    @field_data = FieldDatum.where(project: projects)
  end
end
