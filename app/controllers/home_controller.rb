class HomeController < ApplicationController
  before_action :check_access_for_actions, only: [:index, :contact, :about]
	
  def index
  end

  def contact
  end

  def about
  end

  def privilage
    if home = {:employee=> Page.where(user_role: :employee,page_name: :home).present?, :manager=>Page.where(user_role: :manager,page_name: :home).present?}
      return true
    elsif home = {:employee=> Page.where(user_role: :employee,page_name: :home).present?, :manager=>Page.where(user_role: :manager,page_name: :home).present?}
      return false
    end
  end

  def role_permission_privilage
    if params[:checked]
      @page = Page.new(:user_role => params[:user_role], :page_name => params[:page_name])
      @page.save
    else
      @page = Page.find (params[:id])
      @page.destroy
    end
  end

  def set_access_permissions
    @page = Page.find(params[:page_id])
    if params[:role] == "employee"
      @page.update(access_to_employee: params[:access_allowed])
    elsif params[:role] == "manager"
      @page.update(access_to_manager: params[:access_allowed])
    end
    respond_to do |format|
      format.js 
    end 

  end

  private 

    def check_access_for_actions
      if params[:action] == "index"
        @page = Page.find_by(page_name: params[:controller])
      else
        @page = Page.find_by(page_name: params[:action])
      end
      if !@page.access_to_employee && current_user.role == "employee"
        @alert = "You are not allowed to access this page because you have an employee role and your administration has not assigned any permissions access this page."
      elsif !@page.access_to_manager && current_user.role == "manager"
        @alert = "You are not allowed to access this page because you have a manager role and your administration has not assigned any permissions access this page."
      end
    end

end
