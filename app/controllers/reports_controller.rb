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
        report_community.destroy
      end
    end
    # DELETE OLD REPORT COMMUNITIES
    #------------------------------------
    @project.field_datum.each do |field_data|
      @report_community = ReportCommunity.find_or_create_by(community:field_data.community)
      percentage_cover = 0
      mean_canopy_diameter = 0
      description = ''
      observations = Observation.where(field_datum_id:field_data.id)
      observations.each do |observation|
        crown_diameters = CrownDiameter.where(observation_id:observation.id)
        crown_diameters.each do |crown_diameter|
          mean_canopy_diameter = mean_canopy_diameter+(crown_diameter.lower_crown_diameter.to_f + crown_diameter.upper_crown_diameter.to_f)/2
        end
        plant_covers = PlantCover.where(observation_id:observation.id)
        plant_covers.each do |plant_cover|
          percentage_cover = percentage_cover+plant_cover.percentage
        end
        growth_forms = GrowthForm.where(observation_id:observation.id)
        growth_forms.each do |growth_form|
          description = growth_form.description
          CommunityGrowthForm.find_or_create_by(description:description,report_community_id:@report_community.id)
        end
        community_growth_forms = CommunityGrowthForm.where(report_community_id:@report_community.id)
        community_growth_forms.each do |community_growth_form|
          CommunityCover.find_or_create_by(species_id:observation.species.id,community_growth_form:community_growth_form) do |community_cover|
            if community_cover.percentage_cover.nil?
              community_cover.percentage_cover = percentage_cover
            else
              community_cover.percentage_cover =   community_cover.percentage_cover+percentage_cover
            end
            if community_cover.mean_canopy_diameter.nil?
              community_cover.mean_canopy_diameter = mean_canopy_diameter
            else
              community_cover.mean_canopy_diameter =   community_cover.mean_canopy_diameter+mean_canopy_diameter
            end
            community_cover.save!
          end
        end
      end
      # 1st Loop
      total_percentage_cover = 0.0
      community_growth_forms = CommunityGrowthForm.where(report_community_id:@report_community.id)
      community_growth_forms.each do |community_growth_form|
        community_covers = CommunityCover.where(community_growth_form_id:community_growth_form.id)
        community_cover_count = community_covers.count
        community_covers.each do |community_cover|
          community_cover.percentage_cover = (community_cover.percentage_cover/@project.field_datum.count)
          community_cover.mean_canopy_diameter = (community_cover.mean_canopy_diameter/community_cover_count)
          community_cover.individual_per_hectare = ((community_cover.percentage_cover * 100)/(( Math::PI)*(community_cover.mean_canopy_diameter**2)/4)).to_i
          community_cover.save!
          if community_growth_form.percentage_cover_mean.nil?
            community_growth_form.percentage_cover_mean = community_cover.percentage_cover
          else
            community_growth_form.percentage_cover_mean = (community_cover.percentage_cover+community_growth_form.percentage_cover_mean)
          end
          if community_growth_form.occurance_mean.nil?
            community_growth_form.occurance_mean = community_cover_count
          else
            community_growth_form.occurance_mean = community_growth_form.occurance_mean+community_cover_count
          end
          community_growth_form.save!
        end
        community_growth_form.occurance_mean = community_growth_form.occurance_mean/community_cover_count
        community_growth_form.save!
        community_growth_form.percentage_cover_mean = community_growth_form.percentage_cover_mean/community_cover_count
        yysquare = 0
        slope_divisor = 0
        slope = 0
        community_covers = CommunityCover.where(community_growth_form_id:community_growth_form.id)
        community_covers.each do |community_cover|
          if community_growth_form.slope.nil?
            community_growth_form.slope = (community_cover_count - community_growth_form.occurance_mean) * (community_cover.percentage_cover - community_growth_form.percentage_cover_mean)
          else
            community_growth_form.slope = community_growth_form.slope+(community_cover_count - community_growth_form.occurance_mean) * (community_cover.percentage_cover - community_growth_form.percentage_cover_mean)
          end
          if community_growth_form.std_deviation.nil?
            community_growth_form.std_deviation = ((community_cover.percentage_cover-community_growth_form.percentage_cover_mean)**2)
          else
            community_growth_form.std_deviation = community_growth_form.std_deviation+((community_cover.percentage_cover-community_growth_form.percentage_cover_mean)**2)
          end
          puts "(#{community_growth_form.std_error} = (#{community_cover_count}-#{community_growth_form.occurance_mean})*(#{community_cover.percentage_cover}-#{community_growth_form.percentage_cover_mean})"
          if community_growth_form.std_error.nil?
            community_growth_form.std_error = (community_cover_count-community_growth_form.occurance_mean)*(community_cover.percentage_cover-community_growth_form.percentage_cover_mean)
          else
            community_growth_form.std_error = community_growth_form.std_error+(community_cover_count-community_growth_form.occurance_mean)*(community_cover.percentage_cover-community_growth_form.percentage_cover_mean)
          end
          community_growth_form.save!
          slope_divisor = (slope_divisor+(community_cover_count-community_growth_form.occurance_mean)**2)
          yysquare = (yysquare+(community_cover.percentage_cover-community_growth_form.percentage_cover_mean)**2)
          if community_growth_form.percentage_cover.nil?
            community_growth_form.percentage_cover = community_cover.percentage_cover
          else
            community_growth_form.percentage_cover = community_growth_form.percentage_cover+community_cover.percentage_cover
          end
          if community_growth_form.mean_canopy_diameter.nil?
            community_growth_form.mean_canopy_diameter = community_cover.mean_canopy_diameter
          else
            community_growth_form.mean_canopy_diameter = community_growth_form.mean_canopy_diameter+community_cover.mean_canopy_diameter
          end
          if community_growth_form.individuals_per_hectare.nil?
            community_growth_form.individuals_per_hectare = community_cover.individual_per_hectare
          else
            community_growth_form.individuals_per_hectare = community_growth_form.individuals_per_hectare+community_cover.individual_per_hectare
          end
          community_growth_form.save!
          total_percentage_cover = total_percentage_cover+community_cover.percentage_cover
        end
        community_growth_form_count = @report_community.community_growth_forms.count
        if community_growth_form_count > 2
          count2 = community_growth_form_count -2
        else
          count2 = 1
        end
        if slope_divisor > 0
          community_growth_form.slope = community_growth_form.slope/slope_divisor
          community_growth_form.std_error = ((((yysquare-(community_growth_form.std_error**2)/slope_divisor)**8)/count2)**0.5)
        else
          community_growth_form.slope = 0
          community_growth_form.std_error = 0
        end
        community_growth_form.intercept = (community_growth_form.percentage_cover_mean-(community_growth_form.occurance_mean*community_growth_form.slope))
        community_growth_form.std_deviation = (community_growth_form.std_deviation/community_growth_form_count**0.5)
        community_growth_form.save!
        community_covers = CommunityCover.where(community_growth_form_id:community_growth_form.id)
        community_covers.each do |community_cover|
          community_cover.predicted_cover = (community_cover_count*community_growth_form.slope)+community_growth_form.intercept
          community_cover.difference = community_cover.percentage_cover-community_cover.predicted_cover
          community_cover.proportional_cover = community_cover.percentage_cover/total_percentage_cover
          # ==== Competitor Key ====
          #      0 = Strong
          #      1 = Normal
          #      2 = Weak
          puts "Diffrence #{community_cover.difference}"
          puts "std Error #{community_growth_form.std_error}"
          if community_cover.difference>community_growth_form.std_error
            community_cover.competitor = 0
            community_growth_form.has_strong_competitor = true
          elsif community_cover.difference<(community_growth_form.std_error*-1)
            community_cover.competitor = 2
            community_growth_form.has_weak_competitor = true
          else
            community_cover.competitor = 1
            community_growth_form.has_normal_competitor = true
          end
          community_cover.save!
        end
        if @report_community.percentage_cover.nil?
          @report_community.percentage_cover = community_growth_form.percentage_cover
        else
          @report_community.percentage_cover = @report_community.percentage_cover+community_growth_form.percentage_cover
        end
        if @report_community.mean_canopy_diameter.nil?
          @report_community.mean_canopy_diameter = community_growth_form.mean_canopy_diameter
        else
          @report_community.mean_canopy_diameter = @report_community.mean_canopy_diameter+community_growth_form.mean_canopy_diameter
        end
        if @report_community.individuals_per_hectare.nil?
          @report_community.individuals_per_hectare = community_growth_form.individuals_per_hectare
        else
          @report_community.individuals_per_hectare = @report_community.individuals_per_hectare+community_growth_form.individuals_per_hectare
        end
        @report_community.save!
        total_percentage_cover=total_percentage_cover+community_growth_form.percentage_cover
        community_growth_form.save!
        if total_percentage_cover >0
          community_growth_form.proportional_cover = (community_growth_form.percentage_cover/total_percentage_cover)*100
        else
          community_growth_form.proportional_cover = 0
        end
        community_growth_form.save!
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
