class FieldDataController < ApplicationController
  before_action :set_field_datum, only: [:show, :edit, :update, :destroy]
  before_action :deny_to_admins_and_companies
  # GET /field_data
  # GET /field_data.json
  def index
    projects = Project.where(company_id:current_user.company_id)
    @field_data = FieldDatum.where(project: projects)
  end

  # GET /field_data/1
  # GET /field_data/1.json
  def show
  end

  # GET /field_data/new
  def new
    @field_datum = FieldDatum.new
  end

  # GET /field_data/1/edit
  def edit
  end

  # POST /field_data
  # POST /field_data.json
  def create
    @field_datum = FieldDatum.new(field_datum_params)
    @field_datum.user_id = current_user.id
    respond_to do |format|
      if @field_datum.save
        format.html { redirect_to @field_datum, notice: 'Field datum was successfully created.' }
        format.json { render :show, status: :created, location: @field_datum }
      else
        format.html { render :new }
        format.json { render json: @field_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_data/1
  # PATCH/PUT /field_data/1.json
  def update
    respond_to do |format|
      if @field_datum.update(field_datum_params)
        format.html { redirect_to @field_datum, notice: 'Field datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @field_datum }
      else
        format.html { render :edit }
        format.json { render json: @field_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_data/1
  # DELETE /field_data/1.json
  def destroy
    @field_datum.destroy
    respond_to do |format|
      format.html { redirect_to field_data_url, notice: 'Field datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_datum
      @field_datum = FieldDatum.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def field_datum_params
      params.require(:field_datum).permit(:date, :location_id, :latitude_degree, :latitude_minutes, :latitude_seconds, :longitude_degree, :longitude_minutes, :longitude_seconds, :habitat_description, :project_id,observations_attributes:[:id ,:notes, :species_id ,:_destroy,growth_forms_attributes:[:id,:description ,:_destroy,],plant_covers_attributes:[:id,:percentage, :lower_class_limit, :upper_class_limit, :class_interval, :_destroy], crown_diameters_attributes:[:id, :lower_crown_diameter, :upper_crown_diameter, :transect_length, :_destroy]])
    end
    def deny_to_admins_and_companies
      redirect_to new_user_session_path unless user_signed_in?
    end
end
