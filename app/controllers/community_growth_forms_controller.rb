class CommunityGrowthFormsController < ApplicationController
  before_action :set_community_growth_form, only: [:show, :edit, :update, :destroy]
  before_action :deny_to_admins_and_companies
  # GET /community_growth_forms
  # GET /community_growth_forms.json
  def index
    projects = Project.where(company_id:current_user.company_id)
    communities = Community.where(project:projects)
    report_communities = ReportCommunity.where(community:communities)
    @community_growth_forms = CommunityGrowthForm.where(report_community:report_communities)
  end

  # GET /community_growth_forms/1
  # GET /community_growth_forms/1.json
  def show
  end

  # GET /community_growth_forms/new
  def new
    @community_growth_form = CommunityGrowthForm.new
  end

  # GET /community_growth_forms/1/edit
  def edit
  end

  # POST /community_growth_forms
  # POST /community_growth_forms.json
  def create
    @community_growth_form = CommunityGrowthForm.new(community_growth_form_params)

    respond_to do |format|
      if @community_growth_form.save
        format.html { redirect_to @community_growth_form, notice: 'Community growth form was successfully created.' }
        format.json { render :show, status: :created, location: @community_growth_form }
        logger.info "New community growth form: #{@community_growth_form.attributes.inspect}"
      else
        format.html { render :new }
        format.json { render json: @community_growth_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /community_growth_forms/1
  # PATCH/PUT /community_growth_forms/1.json
  def update
    respond_to do |format|
      if @community_growth_form.update(community_growth_form_params)
        format.html { redirect_to @community_growth_form, notice: 'Community growth form was successfully updated.' }
        format.json { render :show, status: :ok, location: @community_growth_form }
        logger.info "New community growth form: #{@community_growth_form.attributes.inspect}"
      else
        format.html { render :edit }
        format.json { render json: @community_growth_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_growth_forms/1
  # DELETE /community_growth_forms/1.json
  def destroy
    @community_growth_form.destroy
    respond_to do |format|
      format.html { redirect_to community_growth_forms_url, notice: 'Community growth form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_growth_form
      @community_growth_form = CommunityGrowthForm.find(params[:id])
    end
    def deny_to_admins_and_companies
      redirect_to new_user_session_path unless user_signed_in?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def community_growth_form_params
      params.require(:community_growth_form).permit(:description, :count, :percentage_cover_mean, :occurance_mean, :slope, :intercept, :percentage_cover, :proportional_cover, :mean_canopy_diameter, :individuals_per_hectare, :std_deviation, :std_error, :has_strong_competitor, :has_normal_competitor, :has_weak_competitor,:report_community_id, :order)
    end
end
