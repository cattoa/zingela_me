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
