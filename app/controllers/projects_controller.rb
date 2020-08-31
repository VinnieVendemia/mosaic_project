class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]
  protect_from_forgery with: :null_session

  def index
    results = Project.all
    results = results.where('school_name LIKE ?', "%#{params[:school_name]}%") unless params[:school_name].blank?
    results = results.where('description LIKE ?', "%#{params[:description]}%") unless params[:description].blank?
    results = results.where('phase_actual_start_date >= ?', params[:phase_actual_start_date]) unless params[:phase_actual_start_date].blank?
    results = results.where('phase_planned_end_date >= ?', params[:phase_planned_end_date]) unless params[:phase_planned_end_date].blank?
    results = results.where('phase_actual_end_date >= ?', params[:phase_actual_end_date]) unless params[:phase_actual_end_date].blank?
    results = results.where('budget_amount <= ?', params[:budget_amount]) unless params[:budget_amount].blank?
    results = results.where('final_estimate_annual_costs <= ?', params[:final_estimate_annual_costs]) unless params[:final_estimate_annual_costs].blank?
    results = results.where('total_phase_actual_spending <= ?', params[:total_phase_actual_spending]) unless params[:total_phase_actual_spending].blank?
    render :json => results.page(params[:page])
  end

  def create
    @project = Project.create!(projects_params)
    render :json => @project
  end

  def show
    render :json => @project
  end

  def update
    @project.update(projects_params)
    head :no_content
  end

  def destroy
    @project.destroy
    head :no_content
  end

  private

  def projects_params
    params.permit(
      :school_name,
      :description,
      :phase_actual_start_date,
      :phase_planned_end_date,
      :phase_actual_end_date,
      :budget_amount,
      :final_estimate_annual_costs,
      :total_phase_actual_spending,
    ).delete_if {|key, value| value.blank? }
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
