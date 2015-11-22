class SpeciesController < ApplicationController
  before_action :set_species, only: [:show, :edit, :update, :destroy]
  before_action :deny_to_admins_and_companies

  # GET /species
  # GET /species.json
  def index
    @species = Species.all
  end

  # GET /species/1
  # GET /species/1.json
  def show
  end

  # GET /species/new
  def new
    @species = Species.new
  end

  # GET /species/1/edit
  def edit
  end

  # POST /species
  # POST /species.json
  def create
    @species = Species.new(species_params)

    respond_to do |format|
      if @species.save
        format.html { redirect_to @species, notice: 'Species was successfully created.' }
        format.json { render :show, status: :created, location: @species }
      else
        format.html { render :new }
        format.json { render json: @species.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /species/1
  # PATCH/PUT /species/1.json
  def update
    respond_to do |format|
      if @species.update(species_params)
        format.html { redirect_to @species, notice: 'Species was successfully updated.' }
        format.json { render :show, status: :ok, location: @species }
      else
        format.html { render :edit }
        format.json { render json: @species.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /species/1
  # DELETE /species/1.json
  def destroy

    @species.destroy
    respond_to do |format|
      format.html { redirect_to species_index_url, notice: 'Species was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_species
      @species = Species.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def species_params
      params.require(:species).permit(:name, :potential_biomass, :species, :threat_status, :sa_endemic, :sysnonym_of, :common_name, :life_cycle, :growth_forms, :min_hieght, :max_height, :min_altitude, :max_altitude, :distribution,:species_family_id)
    end
    
    def deny_to_admins_and_companies
      redirect_to new_user_session_path unless user_signed_in?
    end

end
