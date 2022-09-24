class RenameEmployeeForJobs < ActiveRecord::Migration[7.0]
  def change
    rename_column :jobs, :employee, :duedate
  end
end
