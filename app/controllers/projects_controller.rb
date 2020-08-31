class ProjectsController < ApplicationController

  def index
  
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
    )
  end
end
