
  
# Helper task to do an inital load of the database
module LoadDatabase
  class << self
    def load
      f = JSON.parse(File.read('./ai_dataset.json'))
      f.each do |project|

        actual_start_date = Date.strptime(project['Project Phase Actual Start Date'], '%m/%d/%Y') rescue ''
        planned_end_date = Date.strptime(project['Project Phase Planned End Date'], '%m/%d/%Y') rescue ''
        actual_end_date = Date.strptime(project['Project Phase Actual End Date'], '%m/%d/%Y') rescue ''

        Project.create(
          school_name: project['Project School Name'],
          description: project['Project Description'],
          phase_actual_start_date: actual_start_date,
          phase_planned_end_date: planned_end_date,
          phase_actual_end_date: actual_end_date,
          budget_amount: project['Project Budget Amount'],
          final_estimate_annual_costs: project['Final Estimate of Actual Costs Through End of Phase Amount'],
          total_phase_actual_spending: project['Total Phase Actual Spending Amount']
        )
      end
    end
  end
end
