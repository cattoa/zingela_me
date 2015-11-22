class ManageController < ApplicationController
  before_action :allow_admin

  def users
    @users = User.all
  end

  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
          redirect_to manage_users_path , notice: 'User was successfully created.'
        else
          render :new_user
    end
  end

  def edit_user_password
    @user = User.find(params[:id])
  end

  def update_user_password
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to manage_users_path, notice: 'Users password was successfully updated.'
    else
      render :edit_user_password
    end
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def update_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to "/edit/user/#{@user.id}", notice: 'User was successfully updated.'
    else
      render :edit_user
    end
  end

  def delete_user
    User.delete(params[:id])
    redirect_to manage_users_path
  end


  def new_company
    @company = Company.new
  end

  def create_company
    @company = Company.new(company_params)
    if @company.save
          redirect_to manage_companies_path , notice: 'Company was successfully created.'
        else
          render :new_company
    end
  end

  def companies
    @companies = Company.all
  end

  def edit_company_password
    @company = Company.find(params[:id])
  end

  def update_company_password
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to manage_companies_path, notice: 'Companys password was successfully updated.'
    else
      render :edit_company_password
    end
  end

  def edit_company
    @company = Company.find(params[:id])
  end
  def update_company
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to manage_companies_path, notice: 'Company was successfully updated.'
    else
      render :edit_company
    end
  end

  def delete_company
    Company.delete(params[:id])
    redirect_to manage_companies_path
  end

  private
    def allow_admin
      redirect_to new_admin_session_path unless admin_signed_in?
    end
    def allow_company
      redirect_to new_company_session_path unless company_signed_in?
    end
    def company_params
        params.require(:company).permit(:company_name, :email, :password, :password_confirmation)
    end
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :company_id)
    end
end
