class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string "school_name"
      t.string "description"
      t.date "phase_actual_start_date"
      t.date "phase_planned_end_date"
      t.date "phase_actual_end_date"
      t.bigint "budget_amount"
      t.bigint "final_estimate_annual_costs"
      t.bigint "total_phase_actual_spending"
      t.timestamps
    end
  end
end
