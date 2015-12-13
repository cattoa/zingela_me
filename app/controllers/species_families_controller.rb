class SpeciesFamiliesController < ApplicationController
  before_action :set_species_family, only: [:show, :edit, :update, :destroy]
  before_action :deny_to_admins_and_companies

  # GET /species_families
  # GET /species_families.json
  def index
    @species_families = SpeciesFamily.all
    # @species_families.each do|s|
    #   s.delete
    # end
  end

  # GET /species_families/1
  # GET /species_families/1.json
  def show
  end

  # GET /species_families/new
  def new
    @species_family = SpeciesFamily.new
  end

  # GET /species_families/1/edit
  def edit
  end

  # POST /species_families
  # POST /species_families.json
  def create
    @species_family = SpeciesFamily.new(species_family_params)
    respond_to do |format|
      if @species_family.save
        format.html { redirect_to @species_family, notice: 'Species family was successfully created.' }
        format.json { render :show, status: :created, location: @species_family }
      else
        format.html { render :new }
        format.json { render json: @species_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /species_families/1
  # PATCH/PUT /species_families/1.json
  def update
    respond_to do |format|
      if @species_family.update(species_family_params)
        format.html { redirect_to @species_family, notice: 'Species family was successfully updated.' }
        format.json { render :show, status: :ok, location: @species_family }
      else
        format.html { render :edit }
        format.json { render json: @species_family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /species_families/1
  # DELETE /species_families/1.json
  def destroy

    @species_family.destroy
    respond_to do |format|
      format.html { redirect_to species_families_url, notice: 'Species family was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_species_family
      @species_family = SpeciesFamily.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def species_family_params
      params.require(:species_family).permit(:name)
    end

    def deny_to_admins_and_companies
      redirect_to new_user_session_path unless user_signed_in?
    end
end
